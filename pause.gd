extends Node

func _ready():
	pass

func _on_resume_button_pressed():
	$".".queue_free()

func _on_settings_button_pressed():
	var settings = preload("res://settings.tscn").instantiate()
	add_child(settings)

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

