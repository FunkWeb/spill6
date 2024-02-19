extends MenuButton

signal pause_game

func _on_pressed():
	pause_game.emit()
	get_tree().change_scene_to_file("res://scenes/menu/pause/pause.tscn")
