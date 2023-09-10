--- spawn a disciple army when building with this bonus value is complete
core:add_listener(
	"dust_cult_vmp_cth_army_foreign_slot",
	"ForeignSlotBuildingCompleteEvent",
	function(context)
		return cm:get_regions_bonus_value(context:slot_manager():region(), "dust_cult_vmp_cth_create_zombie_army") ~= 0;
	end,
	function(context)
	out("dust_1")
		local sm = context:slot_manager()
		out("dust_2")
		local faction_name = sm:faction():name();
		out("dust_3")
		local region_name = sm:region():name();
		out("dust_4")
		local x, y = cm:find_valid_spawn_location_for_character_from_settlement(faction_name, region_name, false, true, 12);
		out("dust_5")
		
		if x > 0 then
		out("dust_6")
			-- spawn the army on the faction's turn start, as foreign slot buildings seem to be created just before, meaning attrition is applied before the army is useable
			core:add_listener(
				"dust_cult_vmp_cth_army_foreign_slot_" .. faction_name,
				"FactionTurnStart",
				function(context)
				out("dust_10")
					return context:faction():name() == faction_name;
				end,
				function()
				out("dust_11")
					cm:create_force_with_general(
						faction_name,
                        "jiang_zombie_longspear,jiang_zombie_longspear,jiang_zombie_longspear,jiang_zombie_longspear,jiang_zombie_reg,jiang_zombie_reg,jiang_zombie_reg,jiang_zombie_reg,jiang_zombie_archer,jiang_zombie_archer,jiang_zombie_archer",
						region_name,
						x,
						y,
						"general",
						"wh_main_vmp_master_necromancer",
						"",
						"",
						"",
						"",
						false,
						function(cqi)
						out("dust_12")	
                        cm:apply_effect_bundle_to_characters_force("dust_cult_vmp_cth_bundle_zombie_army", cqi, 0);
						end
					);
				end,
				false
			);
		end;
	end,
	true
);




local function dust_cult_vmp_cth_visibility()
    --- get UI components
    local settlement_list = find_uicomponent(core:get_ui_root(), "settlement_panel", "settlement_list")
    if settlement_list ~= false then
        local childCount = settlement_list:ChildCount()

        --- Turn on visibility in every settlement
        for i=1, childCount - 1  do
            local child = UIComponent(settlement_list:Find(i))
            local dwf_underway = find_uicomponent(child, "settlement_view", "hostile_views", "wh3_daemon_factions")
            dwf_underway:SetVisible(true)
        end 
    end
end

local function dust_cult_vmp_cth_visibility_listener()
    --- Trigger check for visibility when settlement is selected
    core:add_listener(
        "dust_cult_vmp_cth_less_trigger",
        "SettlementSelected",
        true,
        function()
            core:get_tm():real_callback(function()
                dust_cult_vmp_cth_visibility()
            end, 1)
        end,
        true
    )


    --- Trigger whenever vampire underway slot is pressed
    core:add_listener(
        "dust_cult_vmp_cth_click_trigger_1",
        "ComponentLClickUp",
        function (context)
            return context.string == "button_expand_slot"
        end,
        function()
            core:get_tm():real_callback(function()
                dust_cult_vmp_cth_visibility()
            end, 100)
        end,
        true
    )


    --- Trigger whenever vampire underway slot is pressed
    core:add_listener(
        "dust_cult_vmp_cth_click_trigger_2",
        "ComponentLClickUp",
        function (context)
            return context.string == "square_building_button"
        end,
        function()
            core:get_tm():real_callback(function()
                dust_cult_vmp_cth_visibility()
            end, 100)
        end,
        true
    )
end

cm:add_first_tick_callback(
    function() 
        local dust_cult_vmp_cth_faction_key = cm:get_faction("wh3_dlc21_vmp_jiangshi_rebels")
        if dust_cult_vmp_cth_faction_key ~= false then 
            if dust_cult_vmp_cth_faction_key:is_human() then
                dust_cult_vmp_cth_visibility_listener()
            end
        end
    end
);