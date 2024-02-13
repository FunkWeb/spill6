extends Node
# hovedmenyen på spillet

func _ready():
	print("menu loaded")
	SoundManager.play_background_menu()

func _on_start_button_pressed():
	print("start button")
	get_tree().change_scene_to_file("res://scenes/menu/start/level_select.tscn")
	SoundManager.test()

func _on_settings_button_pressed():
	print("settings button")
	var settings = preload("res://scenes/menu/settings/settings.tscn").instantiate()
	add_child(settings)

func _on_credits_button_pressed():
	print("credits button")
	var credits = preload("res://scenes/credits_scene.tscn").instantiate()
	add_sibling(credits)

func _on_quit_button_pressed():
	print('quit button')
	get_tree().quit()

func _on_pause_button_pressed():
	var pause = preload("res://scenes/menu/pause/pause.tscn").instantiate()
	add_child(pause)
