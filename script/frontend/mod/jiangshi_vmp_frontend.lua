core:add_ui_created_callback(
    function(context)
        mixer_add_starting_unit_list_for_faction("wh3_dlc21_vmp_jiangshi_rebels",
        {"jiang_grave_guard_halberd", "jiang_zombie_longspear", "jiang_zombie_longspear", "jiang_zombie_longspear", "jiang_shadow_lantern","jiang_shuimu"})

        mixer_change_lord_name("406310025", "yuwei_feng_0")

        mixer_add_faction_to_major_faction_list("wh3_dlc21_vmp_jiangshi_rebels")
    end
)