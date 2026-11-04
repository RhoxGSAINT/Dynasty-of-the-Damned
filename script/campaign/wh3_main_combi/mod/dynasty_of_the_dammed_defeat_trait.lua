local dynasty_of_the_dammed_defeat_trait = {
    ["ws_yuwei_feng"] = "trait_defeated_ws_cha_yuwei_feng",
}

local function gabe_get_enemy_legendary_lords_in_last_battle(character)
	local pb = cm:model():pending_battle();
	local LL_attackers = {};
	local LL_defenders = {};
	local was_attacker = false;

	local num_attackers = cm:pending_battle_cache_num_attackers();
	local num_defenders = cm:pending_battle_cache_num_defenders();

	if pb:night_battle() == true or pb:ambush_battle() == true then
		num_attackers = 1;
		num_defenders = 1;
	end
	
	for i = 1, num_attackers do
		local this_char_cqi, this_mf_cqi, current_faction_name = cm:pending_battle_cache_get_attacker(i);
		local char_subtype = cm:pending_battle_cache_get_attacker_subtype(i);
		
		if this_char_cqi == character:cqi() then
			was_attacker = true;
			break;
		end
		
		if dynasty_of_the_dammed_defeat_trait[char_subtype] ~= nil then
			table.insert(LL_attackers, char_subtype);
		end
	end
	
	if was_attacker == false then
		return LL_attackers;
	end
	
	for i = 1, num_defenders do
		local this_char_cqi, this_mf_cqi, current_faction_name = cm:pending_battle_cache_get_defender(i);
		local char_subtype = cm:pending_battle_cache_get_defender_subtype(i);
		
		if dynasty_of_the_dammed_defeat_trait[char_subtype] ~= nil then
			table.insert(LL_defenders, char_subtype);
		end
	end
	return LL_defenders;
end

core:add_listener(
    "dynasty_of_the_dammed_defeat_trait",
    "CharacterCompletedBattle",
    true,
    function(context)
        local character = context:character()
        if cm:char_is_general_with_army(character) and character:won_battle() then
            local LL_enemies = gabe_get_enemy_legendary_lords_in_last_battle(character);
    
            for i = 1, #LL_enemies do
                local LL_trait = dynasty_of_the_dammed_defeat_trait[LL_enemies[i]]
                
                if LL_trait ~= nil then
                    campaign_traits:give_trait(character, LL_trait)
                end
            end
        end
    end,
    true
)