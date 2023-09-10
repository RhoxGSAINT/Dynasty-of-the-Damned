local subculture_key = "jiangshi_subculture"

local function rite_unlocks()
    local rites = {
        --jiangshi spirit unlock
        --build wh_main_vmp_bindingcircle_3
        {
            -- ["subculture"] = "jiangshi_subculture",
            ["rite_name"] = "ritual_unshackled_spirits",
            ["event_name"] = "BuildingCompleted",
            ["condition"] =
            function(context, faction_name)
                    local building = context:building();
                    return building:faction():name() == faction_name and building:name() == "wh_main_vmp_bindingcircle_3";
                end
        },
        
        --jiangshi necroarbo
        --build wh_main_vmp_necromancers_1
        {
            -- ["subculture"] = "jiangshi_subculture",
            ["rite_name"] = "ritual_arboreonecromantics",
            ["event_name"] = "BuildingCompleted",
            ["condition"] =
            function(context, faction_name)
                    local building = context:building();
                    
                    return building:faction():name() == faction_name and building:name() == "wh_main_vmp_necromancers_1";
                end
        },
        {
            -- ["subculture"] = "jiangshi_subculture",
            ["rite_name"] = "ritual_tenuos_pacts",
            ["event_name"] = "CharacterGarrisonTargetAction",
            ["condition"] =
            function(context, faction_name)
                    local character = context:character();
                    
                    return character:faction():name() == faction_name and character:character_type("wizard");
                end
        },

        --Call of night
        --faction leader rank 10
        {
            -- ["subculture"] = "jiangshi_subculture",
            ["rite_name"] = "ritual_call_the_night",
            ["event_name"] = "CharacterRankUp",
            ["condition"] =
            function(context, faction_name)
                    local character = context:character();
                    
                    return character:faction():name() == faction_name and tonumber(character:rank()) >= 10;
                end
        },
    }

    local human_factions = cm:get_human_factions_of_subculture(subculture_key)

    for i = 1, #human_factions do
        local human_faction = human_factions[i]
        local faction_obj = cm:get_faction(human_faction)

        for j = 1, #rites do
            local this_rite_template = rites[j]

            cm:lock_ritual(faction_obj, this_rite_template.rite_name)
            local rite = rite_unlock:new(
                this_rite_template.rite_name,
                this_rite_template.event_name,
                this_rite_template.condition,
                true
            )

            rite:start(human_faction)
        end
    end
end

cm:add_first_tick_callback(rite_unlocks)