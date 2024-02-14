extends Control

func _input(event):
	if Input.is_action_pressed("cancel"):
		visible = false
