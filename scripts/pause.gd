extends Control

func _ready():
	pass

func _on_resume_button_pressed():
	$".".hide()
	get_parent().camera.enabled = true
	# kansje en timer for å gi spilleren litt tid til å gjøre seg klar
	get_tree().paused = false

func _on_settings_button_pressed():
	var settings = preload("res://scenes/menu/settings/settings.tscn").instantiate()
	add_child(settings)

func _on_quit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
