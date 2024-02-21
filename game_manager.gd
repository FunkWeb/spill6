extends Node

signal toggle_game_paused(is_paused : bool)

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		print("Game paused: ",game_paused)
		get_tree().paused = game_paused
		toggle_game_paused.emit(game_paused)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_parent().get_child(-1).name != "Menu":
			if $PauseMenu/Settings.visible:
				$PauseMenu/Settings.hide()
			else:
				game_paused = !game_paused

func _notification(what):
	# pause og fortsett spill med android back button
	if what in [
		NOTIFICATION_APPLICATION_PAUSED, # home button
		NOTIFICATION_WM_GO_BACK_REQUEST]: # back button
		if get_parent().get_child(-1).name != "Menu":
			if $PauseMenu/Settings.visible:
				$PauseMenu/Settings.hide()
			else:
				game_paused = !game_paused

func _on_pause_menu_resume():
	game_paused = !game_paused
