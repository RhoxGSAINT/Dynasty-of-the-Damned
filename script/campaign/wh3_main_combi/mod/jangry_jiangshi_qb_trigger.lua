local jiangshi_faction = "wh3_dlc21_vmp_jiangshi_rebels";

--Courtesy of CJ3200
--This table contains all the quests / missions. The mission key should be in the [ brackets ] and the rest you just fill out
--Fill out trigger = true if the mission triggers based on a character rank. Otherwise, trigger = false
--Fill out follow_up = true if you want the script to trigger the follow up mission. follow_up = false if you want db to trigger the follow on mission.
--Fill out the follow-up mission key
--Fill out the ancillary key in the reward for the final mission
--As long as the missions have this basic structure, there is no need to edit the rest of the script, all you have to do is add to the quests table.
local quests = {
    ["bm_theak_qb_tome"] = {trigger = true, rank = 10, follow_up = false, reward = true, ancil = "the_forbidden_tomes", ai_reward = "the_forbidden_tomes"},
    ["bm_theak_qb_dagger"] = {trigger = true, rank = 18, follow_up = false, reward = true, ancil = "the_forbidden_tomes", ai_reward = "ancient_sacrifical_dagger"},
}

--Just a table of the keys for multiplayer compatibilty. I fill in this table in the add_rank_listener() function
local quest_keys = {
}

local function add_rank_listener()
    for key, value in pairs (quests) do
        quest_keys[#quest_keys+1] = key
    end
    table.sort(quest_keys)

    for i, quest in ipairs(quest_keys) do
        if quests[quest].trigger == true then
            core:add_listener(
                quest.."listener",
                "CharacterRankUp",
                function(context)
                    return context:character():character_subtype_key() == "jiang_xiu_necro" and context:character():faction():name() == jiangshi_faction
                end,
                function(context)
                    local character = context:character()
                    out("Jiang_CharacterRankUp")
                    out(character:character_subtype_key())
                    out(character:rank())
                    out(character:faction():name())
                    if character:rank() >= quests[quest].rank and not cm:get_saved_value(quest) then
                        if character:faction():is_human() == true then
                            cm:trigger_mission(jiangshi_faction, quest, true)
                            out("CJ triggered "..quest)
                        else
                            cm:force_add_ancillary(character, quests[quest].ai_reward, true, false)
                        end
                        cm:set_saved_value(quest, true)
                    end
                end,
                true      
            )
        end
    end

    core:add_listener(
        "Jiang_MissionSucceeded",
        "MissionSucceeded",
        function(context)
            local faction = context:faction();
            local mission_key = context:mission():mission_record_key()
            return faction:is_human() == true and faction:name() == jiangshi_faction and quests[mission_key] ~= nil
        end,
        function(context)
            out("CJ Jiang completed a mission")
            local mission_key = context:mission():mission_record_key()
            local faction = context:faction()
            local faction_key = faction:name()
            
            out(mission_key)

            if faction_key ~= jiangshi_faction then
                out("Jinag mission completed by faction = "..faction_key.."! How can this happen?")
                return
            end
        
            if quests[mission_key].follow_up == true then
                out("CJ successful mission - attempting to trigger "..quests[mission_key].follow_up_mission)
                cm:trigger_mission(jiangshi_faction, quests[mission_key].follow_up_mission, true)
            end
        
            if quests[mission_key].reward == true then
                local char_list = faction:character_list()
                for i = 0, char_list:num_items() - 1 do
        
                    local current_char = char_list:item_at(i)
                    local char_type = current_char:character_subtype_key()
                
                    out(char_type)
                    if char_type == "jiang_xiu_necro" then
                        cm:force_add_ancillary(current_char, quests[mission_key].ancil, true, false)
                    end
                end
            end

        end,
        true
    )
end

cm:add_first_tick_callback(function() add_rank_listener() end)