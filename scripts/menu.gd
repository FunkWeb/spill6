extends Node
# hovedmenyen på spillet

func _ready():
	print("menu loaded")
	SoundManager.play_background_menu()

func _on_start_button_pressed():
	var level_select = preload("res://scenes/menu/start/level_select.tscn").instantiate()
	add_child(level_select)
	SoundManager.start_button()

func _on_settings_button_pressed():
	$Settings.show()

func _on_credits_button_pressed():
	$Control.show()

func _on_quit_button_pressed():
	print('quit button')
	get_tree().quit()

func _on_pause_button_pressed():
	$Pause.show()
