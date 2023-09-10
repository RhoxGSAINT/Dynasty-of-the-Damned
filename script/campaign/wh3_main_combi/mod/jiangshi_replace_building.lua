cm:add_first_tick_callback(
    function()
        if cm:is_new_game() then
            local region_interface =
                cm:model():world():region_manager():region_by_key("wh3_main_combi_region_shiyamas_rest")
            cm:region_slot_instantly_dismantle_building(
                region_interface:settlement():active_secondary_slots():item_at(0)
            )
            cm:region_slot_instantly_upgrade_building(
                region_interface:settlement():active_secondary_slots():item_at(0),
                "wh_main_vmp_bindingcircle_1"
            )
        end
    end
)
