-- Script made by Xoudad - So proud of it \o/

--cm:add_unit_to_faction_mercenary_pool(faction_interface, unit_key, recruitment_source, unit_count, replen_chance, max_units, max_replen_per_turn, faction_requirement, subculture_requirement, culture_requirement, use_partial_replen, merc_unit_group)

local unit_key_jiang_zombie = "jiang_zombie_reg"
local unit_key_jiang_zombie_archer = "jiang_zombie_archer"
local unit_key_jiang_zombie_spear = "jiang_zombie_longspear"
local unit_key_jiang_grave_guard_halberd = "jiang_grave_guard_halberd"
local unit_key_jiang_grave_guard_crossbow = "jiang_grave_guard_crossbow"
local unit_key_jiang_damned_cannon = "jiang_damned_cannon"
local unit_key_jiang_necro_mortar = "jiang_necro_mortar"
local unit_key_jiang_shadow_lantern = "jiang_shadow_lantern"
local unit_key_wh_main_vmp_inf_grave_guard_0_jiang = "wh_main_vmp_inf_grave_guard_0_jiang"
local unit_key_wh_main_vmp_inf_grave_guard_1_jiang = "wh_main_vmp_inf_grave_guard_1_jiang"
local unit_key_wh_main_vmp_mon_crypt_horrors = "wh_main_vmp_mon_crypt_horrors"
local unit_key_wh_main_vmp_inf_crypt_ghouls = "wh_main_vmp_inf_crypt_ghouls"
local unit_key_wh_main_vmp_inf_cairn_wraiths = "wh_main_vmp_inf_cairn_wraiths"
local unit_key_wh2_dlc11_cst_inf_syreens = "wh2_dlc11_cst_inf_syreens"
local unit_key_wh2_dlc11_cst_mon_mournguls_0 = "wh2_dlc11_cst_mon_mournguls_0"
local unit_key_wh_main_vmp_cav_hexwraiths = "wh_main_vmp_cav_hexwraiths"
local unit_key_jiang_copsewight = "jiang_copsewight"
local unit_key_jiang_longma_undead = "jiang_longma_undead"
local unit_key_jiang_shuimu = "jiang_shuimu"

local rec_source = "raise_dead"
local subculture = "jiangshi_subculture"
local merc_group = "wh_main_vmp_province_pool"

local function rhox_dotd_initial_raise_dead_setup()
    local region_list = cm:model():world():region_manager():region_list()
    for i=0,region_list:num_items()-1 do
        local region= region_list:item_at(i)
        cm:add_unit_to_province_mercenary_pool(
            region,
            unit_key_jiang_zombie,
            rec_source,
            2,
            35,
            6,
            2,
            "",
            subculture,
            "",
            false,
            merc_group
        )
        cm:add_unit_to_province_mercenary_pool(
            region,
            unit_key_jiang_zombie_spear,
            rec_source,
            2,
            35,
            4,
            3,
            "",
            subculture,
            "",
            false,
            merc_group
        )
        cm:add_unit_to_province_mercenary_pool(
            region,
            unit_key_wh_main_vmp_inf_crypt_ghouls,
            rec_source,
            2,
            20,
            2,
            1,
            "",
            subculture,
            "",
            false,
            merc_group
        )
        cm:add_unit_to_province_mercenary_pool(
            region,
            unit_key_jiang_zombie_archer,
            rec_source,
            2,
            35,
            4,
            3,
            "",
            subculture,
            "",
            false,
            merc_group
        )
    end

end

local function raise_dead_setup()

    -- Main settlements ugrades
    core:add_listener(
        "jiangshi_raise_dead_MainGenericCompleted",  --- Changed listener name to something more unique -UlrikHD
        "BuildingCompleted",
        function(context)
            return context:building():chain() == "wh_main_VAMPIRES_settlement_major" and
                context:building():faction():subculture() == subculture
        end,
        function(context)
            local building_name = context:building():name()
            local building_region = context:building():region()
            if building_name == "wh_main_vmp_settlement_major_2" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie,
                    rec_source,
                    2,
                    45,
                    6,
                    2,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_2" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie_spear,
                    rec_source,
                    2,
                    45,
                    4,
                    3,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_2" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_crypt_ghouls,
                    rec_source,
                    2,
                    30,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_2" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_shuimu,
                    rec_source,
                    1,
                    25,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_2" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie_archer,
                    rec_source,
                    2,
                    45,
                    4,
                    3,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie,
                    rec_source,
                    2,
                    55,
                    6,
                    3,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_necro_mortar,
                    rec_source,
                    1,
                    30,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie_spear,
                    rec_source,
                    2,
                    55,
                    5,
                    4,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie_archer,
                    rec_source,
                    3,
                    55,
                    5,
                    4,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_grave_guard_halberd,
                    rec_source,
                    1,
                    10,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_grave_guard_crossbow,
                    rec_source,
                    1,
                    10,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_grave_guard_0_jiang,
                    rec_source,
                    1,
                    10,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_grave_guard_1_jiang,
                    rec_source,
                    1,
                    10,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_crypt_ghouls,
                    rec_source,
                    2,
                    40,
                    4,
                    2,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_shuimu,
                    rec_source,
                    1,
                    35,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_mon_crypt_horrors,
                    rec_source,
                    1,
                    25,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh2_dlc11_cst_inf_syreens,
                    rec_source,
                    0,
                    15,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh2_dlc11_cst_mon_mournguls_0,
                    rec_source,
                    0,
                    15,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_cairn_wraiths,
                    rec_source,
                    0,
                    15,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_3" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_damned_cannon,
                    rec_source,
                    1,
                    30,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie,
                    rec_source,
                    3,
                    65,
                    7,
                    4,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_shuimu,
                    rec_source,
                    2,
                    40,
                    3,
                    2,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie_spear,
                    rec_source,
                    3,
                    65,
                    5,
                    4,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie_archer,
                    rec_source,
                    3,
                    65,
                    5,
                    4,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_grave_guard_halberd,
                    rec_source,
                    1,
                    15,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_grave_guard_crossbow,
                    rec_source,
                    1,
                    15,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_grave_guard_0_jiang,
                    rec_source,
                    1,
                    15,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_grave_guard_1_jiang,
                    rec_source,
                    1,
                    15,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_crypt_ghouls,
                    rec_source,
                    2,
                    50,
                    5,
                    2,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_mon_crypt_horrors,
                    rec_source,
                    1,
                    35,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh2_dlc11_cst_inf_syreens,
                    rec_source,
                    1,
                    25,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh2_dlc11_cst_mon_mournguls_0,
                    rec_source,
                    1,
                    25,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_cairn_wraiths,
                    rec_source,
                    1,
                    25,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_damned_cannon,
                    rec_source,
                    1,
                    35,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_necro_mortar,
                    rec_source,
                    1,
                    35,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_shadow_lantern,
                    rec_source,
                    1,
                    10,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_4" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_cav_hexwraiths,
                    rec_source,
                    1,
                    10,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_shuimu,
                    rec_source,
                    2,
                    45,
                    4,
                    2,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie,
                    rec_source,
                    4,
                    75,
                    8,
                    4,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie_spear,
                    rec_source,
                    4,
                    75,
                    6,
                    4,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_necro_mortar,
                    rec_source,
                    1,
                    40,
                    3,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_zombie_archer,
                    rec_source,
                    4,
                    75,
                    6,
                    4,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_grave_guard_halberd,
                    rec_source,
                    1,
                    20,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_longma_undead,
                    rec_source,
                    1,
                    20,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_grave_guard_crossbow,
                    rec_source,
                    1,
                    20,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_grave_guard_0_jiang,
                    rec_source,
                    1,
                    20,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_grave_guard_1_jiang,
                    rec_source,
                    1,
                    20,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_crypt_ghouls,
                    rec_source,
                    4,
                    60,
                    6,
                    2,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_mon_crypt_horrors,
                    rec_source,
                    1,
                    40,
                    4,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh2_dlc11_cst_inf_syreens,
                    rec_source,
                    1,
                    30,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh2_dlc11_cst_mon_mournguls_0,
                    rec_source,
                    1,
                    30,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_inf_cairn_wraiths,
                    rec_source,
                    1,
                    30,
                    2,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_damned_cannon,
                    rec_source,
                    1,
                    20,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_shadow_lantern,
                    rec_source,
                    1,
                    20,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_jiang_copsewight,
                    rec_source,
                    1,
                    20,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
            if building_name == "wh_main_vmp_settlement_major_5" then
                cm:add_unit_to_province_mercenary_pool(
                    building_region,
                    unit_key_wh_main_vmp_cav_hexwraiths,
                    rec_source,
                    1,
                    20,
                    1,
                    1,
                    "",
                    subculture,
                    "",
                    false,
                    merc_group
                )
            end
        end,
        true
    )
end

cm:add_first_tick_callback(
    function()
        real_timer.unregister("ui_update_trigger")
        real_timer.register_repeating("ui_update_trigger", 0)
        raise_dead_setup()
        if cm:is_new_game() then
            rhox_dotd_initial_raise_dead_setup()
        end
    end
)
