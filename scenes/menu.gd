extends Node
# hovedmenyen på spillet

# TODO:
# knapp for kreditering

func _ready():
	print("menu loaded")
	SoundManager.play_background_menu()

func _on_start_button_pressed():
	print('start button pressed')
	get_tree().change_scene_to_file("res://scenes/menu/start/level_select.tscn")
	SoundManager.test()

func _on_settings_button_pressed():
	print('settings button pressed')
	get_tree().change_scene_to_file("res://scenes/menu/settings/settings.tscn")

func _on_quit_button_pressed():
	print('quit button pressed')
	get_tree().quit()
