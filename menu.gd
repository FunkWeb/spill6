extends Node
# hovedmenyen på spillet

# TODO:
# knapp for kreditering

func _ready():
	print("menu loaded")
	SoundManager.play_background_menu()

func _on_start_button_pressed():
	print('start button pressed')
	get_tree().change_scene_to_file("res://level_select.tscn")
	SoundManager.test()

func _on_settings_button_pressed():
	print('settings button pressed')
	var settings = preload("res://settings.tscn").instantiate()
	add_child(settings)

func _on_quit_button_pressed():
	print('quit button pressed')
	get_tree().quit()
