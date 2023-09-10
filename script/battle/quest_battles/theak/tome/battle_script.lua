load_script_libraries();

local gc = generated_cutscene:new(true);

gb = generated_battle:new(
	false,                                      -- screen starts black
	false,                                      -- prevent deployment for player
	false,                                      	-- prevent deployment for ai
	function() gb:start_generated_cutscene(gc) end, 	-- intro cutscene function
	false                                      	-- debug mode
);


gc:add_element(nil, nil, "gc_medium_absolute_devastation_of_ostermark_00", 7000, false, false, false);
gc:add_element("tome_qb_pt_01", "tome_qb_pt_01", nil, 11500, false, false, false);
gc:add_element("tome_qb_pt_02", "tome_qb_pt_02", "gc_medium_absolute_devastation_of_ostermark_01", 11900, false, false, false);
gc:add_element(nil, nil, "gc_orbit_90_medium_commander_front_left_extreme_high_01", 3000, false, false, false)
gc:add_element("tome_qb_pt_03", "tome_qb_pt_03", nil, 8000, false, false, false);
gc:add_element(nil, nil, "gc_orbit_ccw_90_medium_commander_front_close_low_01", 5000, false, false, false);
gc:add_element(nil,nil, nil, 3000, true, true, false);


gb:set_cutscene_during_deployment(true);


---------------------------
----HARD SCRIPT VERSION----
---------------------------
gb:set_objective_on_message("deployment_started", "tome_objective");
gb:queue_help_on_message("battle_started", "tome_objective_1_hint");
gb:queue_help_on_message("loyalist_forces_low", "loyalist_forces_low_hint");

-------ARMY SETUP-------
ga_player_01 = gb:get_army(gb:get_player_alliance_num(0), 1);		
ga_loyalist_army = gb:get_army(gb:get_non_player_alliance_num(),"loyalist_army");
ga_loyalist_rein_01 = gb:get_army(gb:get_non_player_alliance_num(),"loyalist_army_rein_01");
ga_loyalist_rein_02 = gb:get_army(gb:get_non_player_alliance_num(),"loyalist_army_rein_02");
--ga_ai_04 = gb:get_army(gb:get_non_player_alliance_num(1), 4);

ga_loyalist_army:attack_on_message("battle_started");
ga_loyalist_army:message_on_casualties("loyalist_forces_low",0.4);
ga_loyalist_rein_01:reinforce_on_message("loyalist_forces_low",5000);
ga_loyalist_rein_01:message_on_deployed("loyalist_army_rein_01", 1000);
ga_loyalist_rein_01:attack_on_message("loyalist_army_rein_01", 3000);
ga_loyalist_rein_02:reinforce_on_message("loyalist_forces_low",5000);
ga_loyalist_rein_02:message_on_deployed("loyalist_army_rein_02", 1000);
ga_loyalist_rein_02:attack_on_message("loyalist_army_rein_02", 3000);

--------ADVICE----------
gb:get_army(gb:get_player_alliance_num(), 1):message_on_victory("player_wins");
gb:advice_on_message("player_wins", "wh2.battle.advice.final_battle_victory.002");

