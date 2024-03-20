extends Node

signal toggle_game_paused(is_paused : bool)

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		
		# Vis/Skjul pauseknappen når man pauser
		var pause_button = get_node("/root/THE-MAP/HUD/RightContainer/PauseButton")
		if pause_button != null:
			if game_paused == true:
				pause_button.visible = false
			else:
				pause_button.visible = true
		
		print("Game paused: ",game_paused)
		get_tree().paused = game_paused
		toggle_game_paused.emit(game_paused)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_node("../CutsceneW1m1") != null or get_node("../Menu") != null:
			return
		if $PauseMenu/Settings.visible:
			$PauseMenu/Settings.hide()
		else:
			game_paused = !game_paused

func _notification(what):
	# pause og fortsett spill med android back button
	if what in [
		NOTIFICATION_APPLICATION_PAUSED, # home button
		NOTIFICATION_WM_GO_BACK_REQUEST]: # back button
		if get_node("../CutsceneW1m1") != null or get_node("../Menu") != null:
			return
		if $PauseMenu/Settings.visible:
			$PauseMenu/Settings.hide()
		else:
			game_paused = !game_paused

func _on_pause_menu_resume():
	game_paused = !game_paused
	
func disconnect_pause_function():
	disconnect("toggle_game_paused",$PauseMenu._on_game_manager_toggle_game_paused)
	
func connect_pause_function():
	connect("toggle_game_paused",$PauseMenu._on_game_manager_toggle_game_paused)
