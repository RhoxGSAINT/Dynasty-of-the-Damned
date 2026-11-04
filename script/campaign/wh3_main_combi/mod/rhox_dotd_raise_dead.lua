-- Vanilla raise dead units that are not in the wh3_jiangshi_group military group
local rhox_dotd_raise_dead_to_remove = {
    ---unit_key, recruitment_source_key
    {"wh3_dlc29_vmp_inf_lahmian_handmaidens_death", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh3_dlc29_vmp_inf_spirit_host", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh3_main_vmp_blood_knights_sword_shield", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh3_dlc29_vmp_inf_lahmian_handmaidens_shadow", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh3_dlc29_vmp_veh_coven_throne", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh3_dlc29_vmp_cav_drakenhof_templars", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh3_dlc29_vmp_mon_zombie_dragon", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_main_vmp_cav_hexwraiths", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_main_vmp_inf_cairn_wraiths", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_main_vmp_mon_terrorgheist", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_main_vmp_mon_vargheists", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_main_vmp_mon_varghulf", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_main_vmp_veh_black_coach", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_dlc02_vmp_cav_blood_knights_0", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_dlc04_vmp_veh_mortis_engine_0", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_main_vmp_inf_skeleton_warriors_0", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_inf_skeleton_warriors_1", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_inf_zombie", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_cav_black_knights_0", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_cav_black_knights_3", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_inf_grave_guard_0", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_inf_grave_guard_1", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_mon_crypt_horrors", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_inf_crypt_ghouls", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_mon_dire_wolves", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_mon_fell_bats", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_dlc04_vmp_veh_corpse_cart_0", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_dlc04_vmp_veh_corpse_cart_1", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_dlc04_vmp_veh_corpse_cart_2", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh3_main_vmp_inf_grave_guard_2", "wh3_dlc29_vmp_raise_dead_province"},
}

local rhox_dotd_raise_dead_to_add = {
    ---unit_key, recruitment_source_key
    {"jiang_zombie_reg", "wh3_dlc29_vmp_raise_dead_province"},
    {"jiang_zombie_longspear", "wh3_dlc29_vmp_raise_dead_province"},
    {"jiang_zombie_archer", "wh3_dlc29_vmp_raise_dead_province"},
    {"jiang_zombie_archer_putridshaft", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_inf_skeleton_warriors_0_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_inf_skeleton_warriors_1_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_inf_grave_guard_0_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_inf_grave_guard_1_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"jiang_grave_guard_halberd", "wh3_dlc29_vmp_raise_dead_province"},
    {"jiang_grave_guard_crossbow", "wh3_dlc29_vmp_raise_dead_province"},
    {"jiang_grave_guard_crossbow_balefireshaft", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_inf_crypt_ghouls_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_mon_crypt_horrors_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_cav_black_knights_0_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_cav_black_knights_3_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_dlc04_vmp_veh_corpse_cart_0_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_dlc04_vmp_veh_corpse_cart_1_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_dlc04_vmp_veh_corpse_cart_2_jiang", "wh3_dlc29_vmp_raise_dead_province"},
    {"wh_main_vmp_cav_hexwraiths_jiang", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_main_vmp_inf_cairn_wraiths_jiang", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_main_vmp_veh_black_coach_jiang", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_dlc02_vmp_cav_blood_knights_0_jiang", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh3_main_vmp_blood_knights_sword_shield_jiang", "wh3_dlc29_vmp_raise_dead_faction"},
    {"wh_dlc04_vmp_veh_mortis_engine_0_jiang", "wh3_dlc29_vmp_raise_dead_faction"},
    {"vmp_jiang_veh_war_compass_0", "wh3_dlc29_vmp_raise_dead_faction"},
    {"jiang_dracolith", "wh3_dlc29_vmp_raise_dead_faction"},
    {"jiang_longma_undead", "wh3_dlc29_vmp_raise_dead_faction"},
    {"jiang_shuimu", "wh3_dlc29_vmp_raise_dead_faction"},
    {"jiang_damned_cannon", "wh3_dlc29_vmp_raise_dead_faction"},
    {"jiang_necro_mortar", "wh3_dlc29_vmp_raise_dead_faction"},
    {"jiang_shadow_lantern", "wh3_dlc29_vmp_raise_dead_faction"},
}

local raise_dead_defaults = {
    replen_chance = 1,
    max = 999999,
    max_per_turn = 100,
    faction_restriction = "",
    subculture_restriction = "",
    tech_restriction = "",
    partial_replenishment = false,
}

local function rhox_dotd_add_raise_dead(faction_obj)
    for i, v in pairs(rhox_dotd_raise_dead_to_add) do
        cm:add_unit_to_faction_mercenary_pool(
            faction_obj,
            v[1],
            v[2],
            raise_dead_defaults.max,
            raise_dead_defaults.replen_chance,
            raise_dead_defaults.max,
            raise_dead_defaults.max_per_turn,
            raise_dead_defaults.faction_restriction,
            raise_dead_defaults.subculture_restriction,
            raise_dead_defaults.tech_restriction,
            raise_dead_defaults.partial_replenishment,
            v[1]
        )
    end
end

local function rhox_dotd_remove_raise_dead(faction_obj)
    for i, v in pairs(rhox_dotd_raise_dead_to_remove) do
        cm:add_unit_to_faction_mercenary_pool(
            faction_obj,
            v[1], -- key
            v[2], -- recruitment source
            0, -- count
            0, --replen chance
            0, -- max units
            0, -- max per turn
            "",	--faction restriction
            "",	--subculture restriction
            "",	--tech restriction
            false, --partial
            v[1]
        );
    end
end

cm:add_first_tick_callback_new(
    function()
        local faction = cm:get_faction("wh3_dlc21_vmp_jiangshi_rebels")
        if faction then
            rhox_dotd_remove_raise_dead(faction)
            rhox_dotd_add_raise_dead(faction)
        end
    end
)
