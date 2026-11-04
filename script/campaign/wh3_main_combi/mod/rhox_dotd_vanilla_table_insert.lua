--LL defeat trait
cm:add_first_tick_callback(
	function()
		campaign_traits.legendary_lord_defeated_traits["ws_yuwei_feng"] ="trait_defeated_ws_cha_yuwei_feng"
	end
)


--technology
table.insert(vampire_technology.locked_techs_vampires.factions, "wh3_dlc21_vmp_jiangshi_rebels")


table.insert(vampire_technology.starting_vampire_techs, {faction = "wh3_dlc21_vmp_jiangshi_rebels", tech = "wh3_main_tech_vmp_vampires_main_1"})
table.insert(vampire_technology.starting_vampire_techs, {faction = "wh3_dlc21_vmp_jiangshi_rebels", tech = "wh3_main_tech_vmp_vampires_main_2"})--while he is a necromancer, he can't build coffin, so a workaround
table.insert(vampire_technology.starting_necromancer_techs, {faction = "wh3_dlc21_vmp_jiangshi_rebels", tech = "wh3_main_tech_vmp_necromancers_0"})
table.insert(vampire_technology.starting_necromancer_techs, {faction = "wh3_dlc21_vmp_jiangshi_rebels", tech = "wh3_main_tech_vmp_necromancers_1"})