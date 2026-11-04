--cm:add_unit_to_faction_mercenary_pool(faction_interface, unit_key, recruitment_source, unit_count, replen_chance, max_units, max_replen_per_turn, faction_requirement, subculture_requirement, culture_requirement, use_partial_replen, merc_unit_group)

local rec_source = "province_recruitment"
--local merc_group = "rhox_dotd_jiangshi_province_pool"

-- {unit_key, unit_count, replen_chance, max_units, max_replen_per_turn, merc_unit_group}
local initial_pool = {
    {"jiang_zombie_reg", 2, 35, 6, 2, "jiang_zombie_reg"},
    {"jiang_zombie_longspear", 2, 35, 4, 3, "jiang_zombie_longspear"},
    {"wh_main_vmp_inf_crypt_ghouls", 2, 20, 2, 1, "wh_main_vmp_inf_crypt_ghouls"},
    {"jiang_zombie_archer", 2, 35, 4, 3, "jiang_zombie_archer"},
}

local building_pools = {
    wh_main_vmp_settlement_major_2 = {
        {"jiang_zombie_reg", 2, 45, 6, 2, "jiang_zombie_reg"},
        {"jiang_zombie_longspear", 2, 45, 4, 3, "jiang_zombie_longspear"},
        {"wh_main_vmp_inf_crypt_ghouls", 2, 30, 2, 1, "wh_main_vmp_inf_crypt_ghouls"},
        {"jiang_shuimu", 1, 25, 1, 1, "jiang_shuimu"},
        {"jiang_zombie_archer", 2, 45, 4, 3, "jiang_zombie_archer"},
    },
    wh_main_vmp_settlement_major_3 = {
        {"jiang_zombie_reg", 2, 55, 6, 3, "jiang_zombie_reg"},
        {"jiang_necro_mortar", 1, 30, 2, 1, "jiang_necro_mortar"},
        {"jiang_zombie_longspear", 2, 55, 5, 4, "jiang_zombie_longspear"},
        {"jiang_zombie_archer", 3, 55, 5, 4, "jiang_zombie_archer"},
        {"jiang_grave_guard_halberd", 1, 10, 1, 1, "jiang_grave_guard_halberd"},
        {"jiang_grave_guard_crossbow", 1, 10, 1, 1, "jiang_grave_guard_crossbow"},
        {"wh_main_vmp_inf_grave_guard_0_jiang", 1, 10, 1, 1, "wh_main_vmp_inf_grave_guard_0_jiang"},
        {"wh_main_vmp_inf_grave_guard_1_jiang", 1, 10, 1, 1, "wh_main_vmp_inf_grave_guard_1_jiang"},
        {"wh_main_vmp_inf_crypt_ghouls", 2, 40, 4, 2, "wh_main_vmp_inf_crypt_ghouls"},
        {"jiang_shuimu", 1, 35, 2, 1, "jiang_shuimu"},
        {"wh_main_vmp_mon_crypt_horrors", 1, 25, 1, 1, "wh_main_vmp_mon_crypt_horrors"},
        {"wh2_dlc11_cst_inf_syreens", 0, 15, 1, 1, "wh2_dlc11_cst_inf_syreens"},
        {"wh2_dlc11_cst_mon_mournguls_0", 0, 15, 1, 1, "wh2_dlc11_cst_mon_mournguls_0"},
        {"wh_main_vmp_inf_cairn_wraiths", 0, 15, 1, 1, "wh_main_vmp_inf_cairn_wraiths"},
        {"jiang_damned_cannon", 1, 30, 2, 1, "jiang_damned_cannon"},
    },
    wh_main_vmp_settlement_major_4 = {
        {"jiang_zombie_reg", 3, 65, 7, 4, "jiang_zombie_reg"},
        {"jiang_shuimu", 2, 40, 3, 2, "jiang_shuimu"},
        {"jiang_zombie_longspear", 3, 65, 5, 4, "jiang_zombie_longspear"},
        {"jiang_zombie_archer", 3, 65, 5, 4, "jiang_zombie_archer"},
        {"jiang_grave_guard_halberd", 1, 15, 2, 1, "jiang_grave_guard_halberd"},
        {"jiang_grave_guard_crossbow", 1, 15, 2, 1, "jiang_grave_guard_crossbow"},
        {"wh_main_vmp_inf_grave_guard_0_jiang", 1, 15, 2, 1, "wh_main_vmp_inf_grave_guard_0_jiang"},
        {"wh_main_vmp_inf_grave_guard_1_jiang", 1, 15, 2, 1, "wh_main_vmp_inf_grave_guard_1_jiang"},
        {"wh_main_vmp_inf_crypt_ghouls", 2, 50, 5, 2, "wh_main_vmp_inf_crypt_ghouls"},
        {"wh_main_vmp_mon_crypt_horrors", 1, 35, 2, 1, "wh_main_vmp_mon_crypt_horrors"},
        {"wh2_dlc11_cst_inf_syreens", 1, 25, 2, 1, "wh2_dlc11_cst_inf_syreens"},
        {"wh2_dlc11_cst_mon_mournguls_0", 1, 25, 1, 1, "wh2_dlc11_cst_mon_mournguls_0"},
        {"wh_main_vmp_inf_cairn_wraiths", 1, 25, 2, 1, "wh_main_vmp_inf_cairn_wraiths"},
        {"jiang_damned_cannon", 1, 35, 2, 1, "jiang_damned_cannon"},
        {"jiang_necro_mortar", 1, 35, 2, 1, "jiang_necro_mortar"},
        {"jiang_shadow_lantern", 1, 10, 1, 1, "jiang_shadow_lantern"},
        {"wh_main_vmp_cav_hexwraiths", 1, 10, 1, 1, "wh_main_vmp_cav_hexwraiths"},
    },
    wh_main_vmp_settlement_major_5 = {
        {"jiang_shuimu", 2, 45, 4, 2, "jiang_shuimu"},
        {"jiang_zombie_reg", 4, 75, 8, 4, "jiang_zombie_reg"},
        {"jiang_zombie_longspear", 4, 75, 6, 4, "jiang_zombie_longspear"},
        {"jiang_necro_mortar", 1, 40, 3, 1, "jiang_necro_mortar"},
        {"jiang_zombie_archer", 4, 75, 6, 4, "jiang_zombie_archer"},
        {"jiang_grave_guard_halberd", 1, 20, 2, 1, "jiang_grave_guard_halberd"},
        {"jiang_longma_undead", 1, 20, 2, 1, "jiang_longma_undead"},
        {"jiang_grave_guard_crossbow", 1, 20, 2, 1, "jiang_grave_guard_crossbow"},
        {"wh_main_vmp_inf_grave_guard_0_jiang", 1, 20, 2, 1, "wh_main_vmp_inf_grave_guard_0_jiang"},
        {"wh_main_vmp_inf_grave_guard_1_jiang", 1, 20, 2, 1, "wh_main_vmp_inf_grave_guard_1_jiang"},
        {"wh_main_vmp_inf_crypt_ghouls", 4, 60, 6, 2, "wh_main_vmp_inf_crypt_ghouls"},
        {"wh_main_vmp_mon_crypt_horrors", 1, 40, 4, 1, "wh_main_vmp_mon_crypt_horrors"},
        {"wh2_dlc11_cst_inf_syreens", 1, 30, 2, 1, "wh2_dlc11_cst_inf_syreens"},
        {"wh2_dlc11_cst_mon_mournguls_0", 1, 30, 2, 1, "wh2_dlc11_cst_mon_mournguls_0"},
        {"wh_main_vmp_inf_cairn_wraiths", 1, 30, 2, 1, "wh_main_vmp_inf_cairn_wraiths"},
        {"jiang_damned_cannon", 1, 20, 1, 1, "jiang_damned_cannon"},
        {"jiang_shadow_lantern", 1, 20, 1, 1, "jiang_shadow_lantern"},
        {"jiang_copsewight", 1, 20, 1, 1, "jiang_copsewight"},
        {"wh_main_vmp_cav_hexwraiths", 1, 20, 1, 1, "wh_main_vmp_cav_hexwraiths"},
        {"wh_dlc04_vmp_veh_corpse_cart_0_jiang", 1, 20, 1, 1, "wh_dlc04_vmp_veh_corpse_cart_0_jiang"},
        {"wh_dlc04_vmp_veh_corpse_cart_1_jiang", 1, 20, 1, 1, "wh_dlc04_vmp_veh_corpse_cart_1_jiang"},
        {"wh_dlc04_vmp_veh_corpse_cart_2_jiang", 1, 20, 1, 1, "wh_dlc04_vmp_veh_corpse_cart_2_jiang"},
    },
}

local function add_pool(region, pool)
    for _, u in ipairs(pool) do
        cm:add_unit_to_province_mercenary_pool(region, u[1], rec_source, u[2], u[3], u[4], u[5], "wh3_dlc21_vmp_jiangshi_rebels", "", "", false, u[6])
    end
end

local function rhox_dotd_initial_raise_dead_setup()
    local region_list = cm:model():world():region_manager():region_list()
    for i = 0, region_list:num_items() - 1 do
        add_pool(region_list:item_at(i), initial_pool)
    end
end

local function raise_dead_setup()
    -- Main settlements ugrades
    core:add_listener(
        "jiangshi_raise_dead_MainGenericCompleted",  --- Changed listener name to something more unique -UlrikHD
        "BuildingCompleted",
        function(context)
            return context:building():chain() == "wh_main_VAMPIRES_settlement_major" and
                context:building():faction():name() == "wh3_dlc21_vmp_jiangshi_rebels"
        end,
        function(context)
            local pool = building_pools[context:building():name()]
            if pool then
                add_pool(context:building():region(), pool)
            end
        end,
        true
    )

    -- Captured settlements: apply every pool tier up to the existing settlement level
    core:add_listener(
        "jiangshi_raise_dead_RegionFactionChange",
        "RegionFactionChangeEvent",
        function(context)
            local region = context:region()
            return not region:is_abandoned() and region:owning_faction():name() == "wh3_dlc21_vmp_jiangshi_rebels"
        end,
        function(context)
            local region = context:region()
            local current_level = 1
            for level = 5, 2, -1 do
                if region:building_exists("wh_main_vmp_settlement_major_" .. level) then
                    current_level = level
                    break
                end
            end
            for level = 2, current_level do
                add_pool(region, building_pools["wh_main_vmp_settlement_major_" .. level])
            end
        end,
        true
    )
end

cm:add_first_tick_callback(
    function()
        raise_dead_setup()
        if cm:is_new_game() then
            rhox_dotd_initial_raise_dead_setup()
        end
    end
)
