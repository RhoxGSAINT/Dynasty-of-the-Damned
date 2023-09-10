-- Worthy Foe Encounter, Spooky
load_script_libraries();

local gc = generated_cutscene:new(true);

gb = generated_battle:new(
	false,                                      -- screen starts black
	false,                                      -- prevent deployment for player
	true,                                      	-- prevent deployment for ai
	function() gb:start_generated_cutscene(gc) end, 	-- intro cutscene function
	false                                      	-- debug mode
);
--generated_cutscene:add_element(sfx_name, subtitle, camera, min_length, wait_for_vo, wait_for_camera, play_taunt_at_start, message_on_start)
gc:add_element(nil, nil, "qb_louen_errantry_war_chaos_01", 6000, true, false, false);
gc:add_element("dagger_qb_pt_01","dagger_qb_pt_01", nil, 10000, true, false, false);
gc:add_element("dagger_qb_pt_02","dagger_qb_pt_02", "qb_louen_errantry_war_chaos_03", 6000, true, false, false);
gc:add_element("dagger_qb_pt_03","dagger_qb_pt_03", nil, 11000, true, true, false);
--gc:add_element(nil, nil, "qb_final_position", 3000, false, false, false);
gb:set_cutscene_during_deployment(true);

-------ARMY SETUP----------
ga_theak = gb:get_army(gb:get_player_alliance_num(), 1, "");
ga_monks = gb:get_army(gb:get_non_player_alliance_num(2),"monk_army_01");
ga_monks_reinforcements_1 = gb:get_army(gb:get_non_player_alliance_num(2),"monk_army_rein_01");
ga_monks_reinforcements_2 = gb:get_army(gb:get_non_player_alliance_num(2),"monk_army_rein_02");
-------ORDERS----------
gb:message_on_time_offset("monk_attack", 10000);
ga_monks:attack_on_message("monk_attack");
ga_monks:message_on_casualties("monk_reinforcements", 0.4);
ga_monks_reinforcements_1:reinforce_on_message("monk_reinforcements", 5000)
ga_monks_reinforcements_1:message_on_deployed("summon_monk_reinforcements_attack")
ga_monks_reinforcements_1:attack_on_message("summon_monk_reinforcements_attack");
ga_monks_reinforcements_1:message_on_casualties("monk_reinforcements_2", 0.4);
ga_monks_reinforcements_2:reinforce_on_message("monk_reinforcements_2", 5000);
ga_monks_reinforcements_2:message_on_deployed("summon_monk_reinforcements_attack");
ga_monks_reinforcements_2:attack_on_message("summon_monk_reinforcements_attack");

-------OBJECTIVES-------
gb:set_objective_on_message("deployment_started", "monk_encounter_objective");

-------HINTS------------
gb:queue_help_on_message("battle_started", "monk_hint_objective");
gb:queue_help_on_message("monk_attack", "monk_attack_minions");
gb:queue_help_on_message("monk_reinforcements", "monk_casualties_1");
gb:queue_help_on_message("monk_reinforcements", "monk_rein_arrival_1");
gb:queue_help_on_message("monk_reinforcements_2", "monk_casualties_2");
gb:queue_help_on_message("monk_reinforcements_2", "monk_rein_arrival_2");
gb:queue_help_on_message("summon_monk_reinforcements_attack", "monk_reinforcements_attack");

--------ADVICE----------
gb:get_army(gb:get_player_alliance_num(), 1):message_on_victory("player_wins");
gb:advice_on_message("player_wins", "wh2.battle.advice.final_battle_victory.002");