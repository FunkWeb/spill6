extends Control

func _ready():
	hide()

func _on_resume_button_pressed():
	$".".hide()
	get_parent().hud.show()
	get_parent().camera.enabled = true
	# kansje en timer for å gi spilleren litt tid til å gjøre seg klar
	get_tree().paused = false

func _on_settings_button_pressed():
	$Settings.show()

func _on_quit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
