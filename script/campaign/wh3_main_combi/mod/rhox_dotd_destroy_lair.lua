local jiangshi_faction_key = "wh3_dlc21_vmp_jiangshi_rebels"
local lair_owned_slot_set = "wh3_dlc29_slot_set_vampire_lair"
local lair_destroy_reward = 1000

local function rhox_dotd_destroy_lair(region_key)
    local region = cm:get_region(region_key)
    if not region or region:is_abandoned() then
        return
    end
    local faction = region:owning_faction()
    if faction:name() ~= jiangshi_faction_key then
        return
    end

    -- Vanilla has already replaced the lair with a Jiangshi owned one by now
    local fsm = region:foreign_slot_manager_for_faction(jiangshi_faction_key, lair_owned_slot_set)
    if fsm:is_null_interface() then
        return
    end
    cm:remove_faction_foreign_slots_from_region(faction:command_queue_index(), region:cqi(), lair_owned_slot_set)

    cm:treasury_mod(jiangshi_faction_key, lair_destroy_reward)

    if not faction:is_human() then
        return
    end

    local incident_builder = cm:create_incident_builder("rhox_dotd_incident_lair_destroyed")
    incident_builder:add_target("default", region)

    -- Dummy text only; the reward itself is given by treasury_mod above
    local payload_builder = cm:create_payload()
    payload_builder:text_display("rhox_dotd_dummy_lair_destroyed_dark_magic")
    incident_builder:set_payload(payload_builder)
    payload_builder:clear()
    cm:launch_custom_incident_from_builder(incident_builder, faction)
end

core:add_listener(
    "rhox_dotd_vampire_lair_destroyed",
    "RegionFactionChangeEvent",
    function(context)
        return context:region():owning_faction():name() == jiangshi_faction_key
    end,
    function(context)
        local region_key = context:region():name()
        -- Defer until the vanilla VampireLairOccupied listener has finished and the event has left the C++ stack
        cm:callback(function()
            rhox_dotd_destroy_lair(region_key)
        end, 0.5)
    end,
    true
)
