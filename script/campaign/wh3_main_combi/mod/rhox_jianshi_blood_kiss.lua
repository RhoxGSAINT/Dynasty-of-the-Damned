function vampire_bloodlines:rhox_jianshi_add_bloodlines_listeners()

    core:add_listener(
        "rhox_jianshi_faction_leader_killed",
        "CharacterConvalescedOrKilled",
        function(context)
            return context:character():is_faction_leader();
        end,
        function(context)
            self:rhox_jianshi_faction_leader_killed(context:character());
        end,
        true
    );
    core:add_listener(
        "rhox_jianshi_vampire_bloodline_on_vassalage",
        "PositiveDiplomaticEvent",
        function(context) return context:is_vassalage() end,
        function(context)
            self:rhox_jianshi_on_vassalage(context);
        end,
        true
    );
    core:add_listener(
        "rhox_jianshi_vampire_bloodline_on_liberation_vassalage",
        "FactionBecomesLiberationVassal",
        true,
        function(context)
            self:rhox_jianshi_on_liberation_vassalage(context);
        end,
        true
    );
    core:add_listener(
        "rhox_jianshi_vampire_bloodline_on_assassination",
        "CharacterCharacterTargetAction",
        function(context) return context:mission_result_critial_success() or context:mission_result_success() end,
        function(context)
            self:rhox_jianshi_on_assassination(context);
        end,
        true
    );
    core:add_listener(
        "rhox_jianshi_vampire_bloodline_on_technology_researched",
        "ResearchCompleted",
        true,
        function(context)
            self:rhox_jianshi_on_technology_researched(context);
        end,
        true
    );

end

-- Blood Kiss from defeating Faction Leaders
function vampire_bloodlines:rhox_jianshi_faction_leader_killed(character)
	local pending_battle = cm:model():pending_battle();
	
	if pending_battle:is_active() then
		local function add_faction_leader_bloodkiss(faction)
			if faction:subculture() == "jiangshi_subculture" then
				cm:faction_add_pooled_resource(faction:name(), "vmp_blood_kiss", "faction_leaders_killed_in_battle", 1);
			end
		end
		
		local character_cqi = character:command_queue_index();
		
		if cm:pending_battle_cache_defender_victory() and pending_battle:has_defender() then
			for i = 1, cm:pending_battle_cache_num_attackers() do
				local attacker_cqi, attacker_force_cqi, attacker_name = cm:pending_battle_cache_get_attacker(i);
				
				if attacker_cqi == character_cqi then
					add_faction_leader_bloodkiss(pending_battle:defender():faction());
					break;
				end
			end
		elseif pending_battle:has_attacker() then
			for i = 1, cm:pending_battle_cache_num_defenders() do
				local defender_cqi, defender_force_cqi, defender_name = cm:pending_battle_cache_get_defender(i);
				
				if defender_cqi == character_cqi then
					add_faction_leader_bloodkiss(pending_battle:attacker():faction());
					break;
				end
			end
		end
	end
end

-- Blood Kiss from gaining a vassal
function vampire_bloodlines:rhox_jianshi_on_vassalage(context)
	if context:proposer_is_vassal() == true then
		local vassal = context:proposer():name();
		
		if self.vassals[vassal] == nil then
			if context:recipient():subculture() == "jiangshi_subculture" then
				cm:faction_add_pooled_resource(context:recipient():name(), "vmp_blood_kiss", "factions_vassalised", 1);
				self.vassals[vassal] = true;
			end
		end
	else
		local vassal = context:recipient():name();
		
		if self.vassals[vassal] == nil then
			if context:proposer():subculture() == "jiangshi_subculture" then
				cm:faction_add_pooled_resource(context:proposer():name(), "vmp_blood_kiss", "factions_vassalised", 1);
				self.vassals[vassal] = true;
			end
		end
	end
end

function vampire_bloodlines:rhox_jianshi_on_liberation_vassalage(context)
	local vassal = context:faction():name();
	
	if self.vassals[vassal] == nil then
		if context:liberating_character():faction():subculture() == "jiangshi_subculture" then
			cm:faction_add_pooled_resource(context:liberating_character():faction():name(), "vmp_blood_kiss", "factions_vassalised", 1);
			self.vassals[vassal] = true;
		end
	end
end

-- Blood Kiss from assassination
function vampire_bloodlines:rhox_jianshi_on_assassination(context)
	if self.assassination_actions[context:agent_action_key()] then
		local faction = context:character():faction();
		
		if faction:subculture() == "jiangshi_subculture" then
			cm:faction_add_pooled_resource(faction:name(), "vmp_blood_kiss", "characters_assassinated", 1);
		end
	end
end

-- Blood Kiss from technology
function vampire_bloodlines:rhox_jianshi_on_technology_researched(context)
	if self.technologies[context:technology()] then
		local faction = context:faction();
		local amount = self.technologies[context:technology()];
		
		if faction:subculture() == "jiangshi_subculture" then
			cm:faction_add_pooled_resource(faction:name(), "vmp_blood_kiss", "other", amount);
		end	
	end
end



cm:add_first_tick_callback(
    function()
        vampire_bloodlines:rhox_jianshi_add_bloodlines_listeners()
    end
)
