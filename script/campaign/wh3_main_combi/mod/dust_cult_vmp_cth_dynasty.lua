--- spawn a disciple army when building with this bonus value is complete
core:add_listener(
	"dust_cult_vmp_cth_army_foreign_slot",
	"ForeignSlotBuildingCompleteEvent",
	function(context)
		return cm:get_regions_bonus_value(context:slot_manager():region(), "dust_cult_vmp_cth_create_zombie_army") ~= 0;
	end,
	function(context)
		local sm = context:slot_manager()
        local faction = sm:faction()
		local faction_name = sm:faction():name();
        local region = sm:region()
		local region_name = sm:region():name();
		local x_coor, y_coor = cm:find_valid_spawn_location_for_character_from_settlement(faction_name, region_name, false, true, 12);

        local settlement = region:settlement();
        local settlement_x = settlement:logical_position_x();
        local settlement_y = settlement:logical_position_y();
		local region_owner = region:owning_faction();
        local region_owner_key = region_owner:name();

		if x_coor > 0 then
			-- spawn the army on the faction's turn start, as foreign slot buildings seem to be created just before, meaning attrition is applied before the army is useable
			core:add_listener(
				"dust_cult_vmp_cth_army_foreign_slot_" .. faction_name,
				"FactionTurnStart",
				function(context)
					return context:faction():name() == faction_name;
				end,
				function()
					cm:create_force_with_general(
						faction_name,
                        "jiang_zombie_longspear,jiang_zombie_longspear,jiang_zombie_longspear,jiang_zombie_longspear,jiang_zombie_reg,jiang_zombie_reg,jiang_zombie_reg,jiang_zombie_reg,jiang_zombie_archer,jiang_zombie_archer,jiang_zombie_archer",
						region_name,
						x_coor,
						y_coor,
						"general",
						"dotd_master_necromancer",
						"",
						"",
						"",
						"",
						false,
						function(cqi)
                            cm:apply_effect_bundle_to_characters_force("dust_cult_vmp_cth_bundle_zombie_army", cqi, 0);
						end
					);
                    
					-- Declare War (if they are not team mates in MPC)
                        if not faction:is_team_mate(region_owner) then
                            cm:force_declare_war(faction_name, region_owner_key, false, false);
                        end
                        
                        -- Destroy Under-City
                        cm:remove_faction_foreign_slots_from_region(faction:command_queue_index(), sm:region():cqi());
                        
                        -- Tell the army owner
                        cm:show_message_event_located(
                            faction_name,
                            "event_feed_strings_text_dust_dotd_event_feed_string_scripted_event_cult_army_title",
                            "regions_onscreen_" .. region_name,
                            "event_feed_strings_text_dust_dotd_event_feed_string_scripted_event_cult_army_description",
                            settlement_x,
                            settlement_y,
                            true,
                            121
                        );
                        
                        -- Tell the region owner
                        cm:show_message_event_located(
                            region_owner_key,
                            "event_feed_strings_text_dust_dotd_event_feed_string_scripted_event_cult_army_title",
                            "regions_onscreen_" .. region_name,
                            "event_feed_strings_text_dust_dotd_event_feed_string_scripted_event_cult_army_description_target",
                            settlement_x,
                            settlement_y,
                            true,
                            121
                        );

				end,
				false
			);
		end;
	end,
	true
);




local function dust_cult_vmp_cth_visibility()
    --- get UI components
    local settlement_list = find_uicomponent(core:get_ui_root(), "settlement_panel", "settlement_list")
    if settlement_list ~= false then
        local childCount = settlement_list:ChildCount()

        --- Turn on visibility in every settlement
        for i=1, childCount - 1  do
            local child = UIComponent(settlement_list:Find(i))
            local dwf_underway = find_uicomponent(child, "settlement_view", "hostile_views", "wh3_daemon_factions")
            dwf_underway:SetVisible(true)
        end 
    end
end

local function dust_cult_vmp_cth_visibility_listener()
    --- Trigger check for visibility when settlement is selected
    core:add_listener(
        "dust_cult_vmp_cth_less_trigger",
        "SettlementSelected",
        true,
        function()
            core:get_tm():real_callback(function()
                dust_cult_vmp_cth_visibility()
            end, 1)
        end,
        true
    )


    --- Trigger whenever vampire underway slot is pressed
    core:add_listener(
        "dust_cult_vmp_cth_click_trigger_1",
        "ComponentLClickUp",
        function (context)
            return context.string == "button_expand_slot"
        end,
        function()
            core:get_tm():real_callback(function()
                dust_cult_vmp_cth_visibility()
            end, 100)
        end,
        true
    )


    --- Trigger whenever vampire underway slot is pressed
    core:add_listener(
        "dust_cult_vmp_cth_click_trigger_2",
        "ComponentLClickUp",
        function (context)
            return context.string == "square_building_button"
        end,
        function()
            core:get_tm():real_callback(function()
                dust_cult_vmp_cth_visibility()
            end, 100)
        end,
        true
    )
end

cm:add_first_tick_callback(
    function() 
        local dust_cult_vmp_cth_faction_key = cm:get_faction("wh3_dlc21_vmp_jiangshi_rebels")
        if dust_cult_vmp_cth_faction_key ~= false then 
            if dust_cult_vmp_cth_faction_key:is_human() then
                dust_cult_vmp_cth_visibility_listener()
            end
        end
    end
);