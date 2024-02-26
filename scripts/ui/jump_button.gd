extends Button
signal jump

func _on_pressed():
	jump.emit()
