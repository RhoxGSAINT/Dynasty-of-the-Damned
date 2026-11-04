local yuwei_mission_key = "rhox_dotd_vmp_mission_confederate_lord_yuwei"

vampire_bloodlines.confederation_missions[yuwei_mission_key]={
			target_faction = "wh3_dlc21_vmp_jiangshi_rebels",
			ritual_key = "rhox_dotd_vmp_ritual_confederate_lord_yuwei",
			lord_subtype = "jiang_xiu_necro",
			limit_power_objective = true,
			payload = {
				"text_display dummy_confederate_lord_yuwei"
			},
			unique_objectives_config = {
				cathay_count = 1,
				cathay_region_group = "cai_region_hint_area_cathay",
				scripted_cathay_key = "rhox_dotd_vmp_scripted_yuwei_cathay_region",
				cathay_override_text = "mission_text_text_rhox_dotd_vmp_yuwei_cathay_region",
			},

			add_unique_objectives = function(faction_key, mm, mission_data, mission_key)
				local objective_data = mission_data.unique_objectives_config

				local objectives = {
					generate_SCRIPTED_MISSION_objective(
						objective_data.scripted_cathay_key,
						objective_data.cathay_override_text,
						objective_data.cathay_count,
						0,
						false
					),
				}

				vampire_bloodlines:add_non_scripted_objectives(mm, objectives)
			end,

			post_trigger_callback = function(faction_key, mission_data, mission_key)
				vampire_bloodlines:rhox_update_yuwei_confederation_objectives(faction_key)
			end
		}
vampire_bloodlines.confederation_rituals["rhox_dotd_vmp_ritual_confederate_lord_yuwei"]="wh3_dlc21_vmp_jiangshi_rebels"

function vampire_bloodlines:rhox_update_yuwei_confederation_objectives(faction_key)
	local mission_data = self.confederation_missions[yuwei_mission_key]
	local objective_data = mission_data.unique_objectives_config
	local faction = cm:get_faction(faction_key)

	if not faction or faction:is_null_interface() then
		return
	end

	-- Cathay regions

	local cathay_completed_saved_value_key = faction_key .. "_yuwei_confederation_cathay_completed"
	local cathay_completed = cm:get_saved_value(cathay_completed_saved_value_key) or false

	if not cathay_completed then
		local cathay_count = 0
		local region_list = faction:region_list()

		for i = 0, region_list:num_items() - 1 do
			local region = region_list:item_at(i)

			if region:is_contained_in_region_group(objective_data.cathay_region_group) then
				cathay_count = cathay_count + 1
			end
		end

		local current_cathay_count = math.min(cathay_count, objective_data.cathay_count)

		cm:set_scripted_mission_text(
			yuwei_mission_key,
			objective_data.scripted_cathay_key,
			objective_data.cathay_override_text,
			current_cathay_count,
			objective_data.cathay_count
		)

		if current_cathay_count >= objective_data.cathay_count then
			cm:complete_scripted_mission_objective(
				faction_key,
				yuwei_mission_key,
				objective_data.scripted_cathay_key,
				true
			)

			cm:set_saved_value(cathay_completed_saved_value_key, true)
		end
	end
end

local function is_valid_yuwei_confederation_faction(faction)
	local mission_data = vampire_bloodlines.confederation_missions[yuwei_mission_key]
	local target_faction = cm:get_faction(mission_data.target_faction)

	return faction
		and faction:is_null_interface() == false
		and faction:is_human()
		and faction:subculture() == "wh_main_sc_vmp_vampire_counts"
		and faction:name() ~= mission_data.target_faction
		and target_faction
		and target_faction:is_human() == false
end

-- Yuwei - Update when a region changes hands
core:add_listener(
	"RhoxVampireBloodlinesYuweiRegionChange",
	"RegionFactionChangeEvent",
	function(context)
		local region = context:region()

		-- razed/abandoned regions have no owner, so owning_faction() is a null interface
		return region:is_abandoned() == false
			and region:owning_faction():is_null_interface() == false
			and is_valid_yuwei_confederation_faction(region:owning_faction())
	end,
	function(context)
		local faction_key = context:region():owning_faction():name()

		cm:callback(
			function()
				vampire_bloodlines:rhox_update_yuwei_confederation_objectives(faction_key)
			end,
			0.1
		)
	end,
	true
)

-- Yuwei - Fallback/state refresh
core:add_listener(
	"RhoxVampireBloodlinesYuweiTurnStartUpdate",
	"FactionTurnStart",
	function(context)
		return is_valid_yuwei_confederation_faction(context:faction())
	end,
	function(context)
		vampire_bloodlines:rhox_update_yuwei_confederation_objectives(context:faction():name())
	end,
	true
)
