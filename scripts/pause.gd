extends Control

func _ready():
	pass

func _on_resume_button_pressed():
	$".".hide()

func _on_settings_button_pressed():
	var settings = preload("res://scenes/menu/settings/settings.tscn").instantiate()
	add_child(settings)

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

