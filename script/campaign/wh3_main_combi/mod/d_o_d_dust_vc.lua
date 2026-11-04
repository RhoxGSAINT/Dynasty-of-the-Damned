

---------------------
local function dust_dod_victory_conditions()
    local mission = {[[
        mission
        {
            victory_type dust_d_o_d_victory_type_faction;
            key wh_main_short_victory;
            issuer CLAN_ELDERS;
            primary_objectives_and_payload
            {
                objective
                {
                    type DESTROY_FACTION;
                    faction wh3_main_cth_the_northern_provinces;
                    faction wh3_main_cth_the_western_provinces;
                    faction wh3_dlc24_cth_the_celestial_court;
                    confederation_valid;
                }
                objective
                {
                    type CONTROL_N_PROVINCES_INCLUDING;
                    total 3;
                    province wh3_main_combi_province_gunpowder_road;
                    province wh3_main_combi_province_wastelands_of_jinshen;
                    province wh3_main_combi_province_celestial_riverlands;
                }
                payload
                {
                    effect_bundle
                    {
                        bundle_key wh3_main_ie_victory_objective_order_short;
                        turns 0;
                    }
                    game_victory;
                }
            }
        }
    ]],
    [[
        mission
        {
            victory_type dust_d_o_d_victory_type_subculture;
            key wh_main_long_victory;
            issuer CLAN_ELDERS;
            primary_objectives_and_payload
            {
                objective
                {
                    type DESTROY_FACTION;
                    faction wh3_dlc24_cth_the_celestial_court;
                    faction wh3_main_cth_burning_wind_nomads;
                    faction wh3_main_cth_the_northern_provinces;
                    faction wh3_main_cth_the_western_provinces;
                    faction wh3_main_cth_the_jade_custodians;
                    faction wh3_main_cth_dissenter_lords_of_jinshen;
                    faction wh3_main_cth_celestial_loyalists;
                    faction wh3_main_cth_imperial_wardens;
                    faction wh3_main_cth_rebel_lords_of_nan_yang;
                    faction wh3_main_cth_eastern_river_lords;
                    faction wh2_dlc11_def_the_blessed_dread;
                    faction wh3_main_grn_dimned_sun;
                    faction wh2_main_skv_clan_eshin;
                    faction wh2_main_skv_clan_eshin_separatists;
                    faction wh3_dlc21_cst_dead_flag_fleet;
                    faction wh3_dlc21_nor_wyrmkins;
                    faction wh3_main_skv_clan_krizzor;
                    confederation_valid;
                }
                objective
                {
                    type CONTROL_N_PROVINCES_INCLUDING;
                    total 23;
                    province wh3_main_combi_province_gunpowder_road;
                    province wh3_main_combi_province_lands_of_stone_and_steel;
                    province wh3_main_combi_province_imperial_road;
                    province wh3_main_combi_province_plains_of_xen;
                    province wh3_main_chaos_province_forests_of_the_moon;
                    province wh3_main_combi_province_warpstone_desert;
                    province wh3_main_combi_province_jade_river_delta;
                    province wh3_main_combi_province_celestial_lake;
                    province wh3_main_combi_province_celestial_riverlands;
                    province wh3_main_combi_province_wastelands_of_jinshen;
                    province wh3_main_combi_province_nongchang_basin;
                    province wh3_main_combi_province_mount_li;
                    province wh3_main_combi_province_broken_lands_of_tian_li;
                    province wh3_main_combi_province_serpent_estuary;
                    province wh3_main_combi_province_the_great_canal;
                }
                payload
                {
                    effect_bundle
                    {
                        bundle_key wh3_main_ie_victory_objective_order_long;
                        turns 0;
                    }
                    game_victory;
                }
            }
        }
    ]]}
    cm:trigger_custom_mission_from_string("wh3_dlc21_vmp_jiangshi_rebels", mission[1]);
    cm:trigger_custom_mission_from_string("wh3_dlc21_vmp_jiangshi_rebels", mission[2]);
    cm:set_saved_value("jiangshi_victory_enabled", true);
end


cm:add_first_tick_callback(
    function()     
        local dust_dod_faction = cm:get_faction("wh3_dlc21_vmp_jiangshi_rebels")
        if dust_dod_faction ~= false then
            if dust_dod_faction:is_human() == true then
                if cm:get_saved_value("jiangshi_victory_enabled") == nil then
                    dust_dod_victory_conditions() 
                end
            end
        end
    end
)

