core:add_ui_created_callback(
	function(context)
        core:add_listener(
            "rhox_dod_get_rid_of_subculture",
            "ComponentLClickUp",
            function (context)
                return context.string == "button_select_race"
            end,
            function (context)
                --out("Rhox Test: button clicked: ".. context.string)
                local parent = find_uicomponent(core:get_ui_root(), "custom_battle", "ready_parent", "recruitment_visibility_parent", "recruitment_parent", "faction_holder", "faction_pic_mask_parent", "button_select_race", "popup_menu", "list_box");
                if not parent then
                    out("Rhox Test: Parent wasn't there")
                    return
                else
                    --out("Rhox Test: Number of child: ".. parent:ChildCount())
                end
                --[[
                for i=0,parent:ChildCount()-1 do
                    local child=find_child_uicomponent_by_index(parent, i)
                    out("Child Id: ".. child:Id())
                end
                --]]
            
                local subculture_to_kill = find_uicomponent(parent, "CcoSubcultureRecordjiangshi_subculture");
                
                if not subculture_to_kill then
                    out("Rhox Test: There wasn't subculture to kill")
                end
                if subculture_to_kill then
                    out("Rhox Test: Killing UI")
                    subculture_to_kill:SetVisible(false)
                end
            end,
            true)
    end
)