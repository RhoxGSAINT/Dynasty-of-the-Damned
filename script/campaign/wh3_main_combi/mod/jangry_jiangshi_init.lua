local rebel_army = {
    "wh3_main_cth_inf_jade_warriors_1",
    "wh3_main_cth_inf_peasant_spearmen_1",
    "wh3_main_cth_inf_peasant_spearmen_1",
    "wh3_main_cth_inf_peasant_archers_0",
    "wh3_main_cth_inf_jade_warriors_0",
    "wh3_main_cth_inf_jade_warriors_0",
    "wh3_main_cth_cav_peasant_horsemen_0",
}

---@return string
local function list_to_string(list)
    local str = list[1]
    for i = 2, #list do
        str = str .. "," .. tostring(list[i])
    end
    return str
end

local function jiangshi_init()
    pcall(function()
        mixer_set_faction_trait("wh3_dlc21_vmp_jiangshi_rebels", "jiangshi_rebels_bundle", true)
    end)
    
    if cm:is_new_game() then
 		
		cm:disable_event_feed_events(true, "wh_event_category_character", "", "");	
		
		local jiangshi_faction = cm:model():world():faction_by_key("wh3_dlc21_vmp_jiangshi_rebels");
		local jiangshi_faction_leader_cqi = jiangshi_faction:faction_leader():command_queue_index();
		
		cm:set_character_immortality(cm:char_lookup_str(jiangshi_faction_leader_cqi), false);
        
		cm:kill_character(jiangshi_faction_leader_cqi, true, true);
		
		cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", "") end, 1);	
        
        local bridge_of_heaven_region = cm:get_region("wh3_main_combi_region_bridge_of_heaven")
        local bridge_of_heaven_slot_list = bridge_of_heaven_region:settlement():slot_list()
        for i = 1, bridge_of_heaven_slot_list:num_items() - 1 do
            local slot = bridge_of_heaven_slot_list:item_at(i)
            cm:instantly_dismantle_building_in_region(slot)
        end
        
        
        local jiangshi_faction_str = "wh3_dlc21_vmp_jiangshi_rebels";
		local jiangshi_unit_list = "jiang_grave_guard_halberd,jiang_zombie_longspear,jiang_zombie_longspear,jiang_zombie_longspear,jiang_zombie_longspear,jiang_shadow_lantern,jiang_shuimu";
        local jiangshi_region_key = "wh3_main_combi_region_nonchang";
        local jiangshi_x_pos = 1265;
        local jiangshi_y_pos = 480;
        local jiangshi__type = "general";
        local jiangshi__subtype = "jiang_xiu_necro";
        local jiangshi_forename = "names_name_778301541";
        local jiangshi_clanname = "";
        local jiangshi_surname = "names_name_778301540";
        local jiangshi_othername = "";
        local jiangshi_is_faction_leader = true;

        cm:create_force_with_general(
            jiangshi_faction_str,
            jiangshi_unit_list,
            jiangshi_region_key,
            jiangshi_x_pos,
            jiangshi_y_pos,
            jiangshi__type,
            jiangshi__subtype,
            jiangshi_forename,
            jiangshi_clanname,
            jiangshi_surname,
            jiangshi_othername,
            jiangshi_is_faction_leader,

            function(cqi)
                jiangshi_char_str = cm:char_lookup_str(cqi)
                cm:set_character_immortality(jiangshi_char_str, true)
                cm:set_character_unique(jiangshi_char_str, true)
                --cm:add_agent_experience(jiangshi_char_str, 1000)
                
            end
        );
        out("JANGRY - Created jiangshi");  
        
--- Stuff to happen after the army spawn ---
        cm:create_agent(
            "wh3_dlc21_vmp_jiangshi_rebels",
            "dignitary",
            "astroliche_theak_01",
            1270,
            486,
            "",
            false)

        if jiangshi_faction:is_human() then     
            
            local jiangshi_enemy_faction_str = "wh3_main_cth_the_jade_custodians";
            local jiangshi_enemy_unit_list = "wh3_main_cth_inf_jade_warriors_1","wh3_main_cth_inf_peasant_spearmen_1","wh3_main_cth_inf_peasant_spearmen_1","wh3_main_cth_inf_peasant_archers_0","wh3_main_cth_inf_jade_warriors_0","wh3_main_cth_inf_jade_warriors_0","wh3_main_cth_cav_peasant_horsemen_0";
            local jiangshi_enemy_region_key = "wh3_main_combi_region_nonchang";
            local jiangshi_enemy_x_pos = 1269;
            local jiangshi_enemy_y_pos = 482;
            local jiangshi_enemy__type = "general";
            local jiangshi_enemy__subtype = "wh3_main_cth_lord_magistrate_yang";
            local jiangshi_enemy_forename = "names_name_1470463468";
            local jiangshi_enemy_clanname = "";
            local jiangshi_enemy_surname = "names_name_1573639756";
            local jiangshi_enemy_othername = "";
            local jiangshi_enemy_is_faction_leader = false;
            
            local jiangshi_enemy_army_cqi = 0

            cm:create_force_with_general(
                jiangshi_enemy_faction_str,
                list_to_string(rebel_army),
                jiangshi_enemy_region_key,
                jiangshi_enemy_x_pos,
                jiangshi_enemy_y_pos,
                jiangshi_enemy__type,
                jiangshi_enemy__subtype,
                jiangshi_enemy_forename,
                jiangshi_enemy_clanname,
                jiangshi_enemy_surname,
                jiangshi_enemy_othername,
                jiangshi_enemy_is_faction_leader,
                function(cqi, mf_cqi)
                    jiangshi_enemy_char_str = cm:char_lookup_str(cqi);
                    jiangshi_enemy_army_cqi = mf_cqi
                    cm:set_force_has_retreated_this_turn(cm:get_military_force_by_cqi(jiangshi_enemy_army_cqi))
                    out(char_str)
                end
            );
                out("JANGRY - Created jiangshi Enemy");
            cm:force_declare_war("wh3_dlc21_vmp_jiangshi_rebels", jiangshi_enemy_faction_str, false, false)
--- How They Play event and first init mission would go here ---
            cm:callback(
                function()
                
                    out("Jangry - How they play is not here yet")
                
                end,
            2);
        
        else
            cm:add_agent_experience(jiangshi_char_str, 3000) -- As the AI will not have the first battle it will get some experience here
        end;
    end;
end;

cm:add_first_tick_callback(jiangshi_init)