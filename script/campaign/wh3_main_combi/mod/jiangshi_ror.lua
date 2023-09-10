--[[
	
	Adds custom Regiments of Renown to specified factions
]]

local function jiangshi_ror()

	-- Checking whether the script has already run for saved games and if it has then the script doesn't need to run again
	if cm:get_saved_value("jiangshi_ror_i_enabled") == nil then

		-- Table for faction, unit key and parameters for add_unit_to_faction_mercenary_pool
		local cror_list = {
            {faction_key = "wh3_dlc21_vmp_jiangshi_rebels", unit = "wh2_dlc11_cst_mon_mournguls_ror_0", merc_pool = "jiangshi_renown_pool", count = 1, rcp = 100, munits = 1, murpt = 0.1, frr = "", srr = "", trr = "", replen = true,merc_group="wh2_dlc11_cst_mon_mournguls_ror_0"},
            {faction_key = "wh3_dlc21_vmp_jiangshi_rebels", unit = "wh_dlc04_vmp_cav_chillgheists_0", merc_pool = "jiangshi_renown_pool", count = 1, rcp = 100, munits = 1, murpt = 0.1, frr = "", srr = "", trr = "", replen = true,merc_group="wh_dlc04_vmp_cav_chillgheists_0"},
            {faction_key = "wh3_dlc21_vmp_jiangshi_rebels", unit = "wh_dlc04_vmp_cav_vereks_reavers_0", merc_pool = "jiangshi_renown_pool", count = 1, rcp = 100, munits = 1, murpt = 0.1, frr = "", srr = "", trr = "", replen = true,merc_group="wh_dlc04_vmp_cav_vereks_reavers_0"},
            {faction_key = "wh3_dlc21_vmp_jiangshi_rebels", unit = "wh_dlc04_vmp_inf_feasters_in_the_dusk_0", merc_pool = "jiangshi_renown_pool", count = 1, rcp = 100, munits = 1, murpt = 0.1, frr = "", srr = "", trr = "", replen = true,merc_group="wh_dlc04_vmp_inf_feasters_in_the_dusk_0"},
            {faction_key = "wh3_dlc21_vmp_jiangshi_rebels", unit = "wh_dlc04_vmp_inf_konigstein_stalkers_0", merc_pool = "jiangshi_renown_pool", count = 1, rcp = 100, munits = 1, murpt = 0.1, frr = "", srr = "", trr = "", replen = true,merc_group="wh_dlc04_vmp_inf_konigstein_stalkers_0"},
            {faction_key = "wh3_dlc21_vmp_jiangshi_rebels", unit = "wh_dlc04_vmp_inf_sternsmen_0", merc_pool = "jiangshi_renown_pool", count = 1, rcp = 100, munits = 1, murpt = 0.1, frr = "", srr = "", trr = "", replen = true,merc_group="wh_dlc04_vmp_inf_sternsmen_0"},
            {faction_key = "wh3_dlc21_vmp_jiangshi_rebels", unit = "wh_dlc04_vmp_veh_claw_of_nagash_0", merc_pool = "jiangshi_renown_pool", count = 1, rcp = 100, munits = 1, murpt = 0.1, frr = "", srr = "", trr = "", replen = true,merc_group="wh_dlc04_vmp_veh_claw_of_nagash_0"},
            {faction_key = "wh3_dlc21_vmp_jiangshi_rebels", unit = "wh2_dlc11_cst_inf_deck_gunners_ror_0", merc_pool = "jiangshi_renown_pool", count = 1, rcp = 100, munits = 1, murpt = 0.1, frr = "", srr = "", trr = "", replen = true,merc_group="wh2_dlc11_cst_inf_deck_gunners_ror_0"},
            {faction_key = "wh3_dlc21_vmp_jiangshi_rebels", unit = "wh3_twa08_cth_mon_terracotta_sentinel_0_ror", merc_pool = "jiangshi_renown_pool", count = 1, rcp = 100, munits = 1, murpt = 0.1, frr = "", srr = "", trr = "", replen = true,merc_group="terra_sentinel_vmp"}
            }; 

		-- Loop for the table above
		for i = 1, #cror_list do
			local faction_name = cror_list[i].faction_key;	-- Faction whose pool the unit(s) should be added to
			local faction = cm:get_faction(faction_name);	-- FACTION_SCRIPT_INTERFACE
			local pool = cror_list[i].merc_pool;            --NEW found in "ui_mercenary_recruitment_infos_tables" table, or in "mercenary_pools_tables" beneath UI recruitment info 
            local unit_key = cror_list[i].unit;				-- Key of unit to add to the mercenary pool, from the main_units table
			local unit_count = cror_list[i].count;			-- Number of units to add to the mercenary pool
			local rcp = cror_list[i].rcp;					-- Replenishment chance, as a percentage
			local munits = cror_list[i].munits;				-- The maximum number of units of the supplied type that the pool is allowed to contain.
			local murpt = cror_list[i].murpt;				-- The maximum number of units of the supplied type that may be added by replenishment per-turn
            local frr = cror_list[i].frr;					-- (may be empty) The key of the faction who can actually recruit the units, from the factions database table
			local srr = cror_list[i].srr;					-- (may be empty) The key of the subculture who can actually recruit the units, from the cultures_subcultures database table
			local trr = cror_list[i].trr;					-- (may be empty) The key of a technology that must be researched in order to recruit the units, from the technologies database table
			local replen = cror_list[i].replen;				-- Allow replenishment of partial units
            local merc_group_key = cror_list[i].merc_group; 	--key used in mercenary_unit_groups_tables can most of the time be the same has main_unit key
			-- Adding the listed unit to the listed faction in the above table
			cm:add_unit_to_faction_mercenary_pool(faction, unit_key, pool, unit_count, rcp, munits, murpt, frr, srr, trr, replen,merc_group_key);

			-- Debug message for log
			out("CROR: adding the custom ror unit " .. unit_key .. " to " .. faction_name);
		end;

		-- Setting saved value, so that the script doesn't run again when reloaded from a saved game
		cm:set_saved_value("jiangshi_ror_i_enabled", true);
	end;
end;

cm:add_first_tick_callback(function() jiangshi_ror() end);