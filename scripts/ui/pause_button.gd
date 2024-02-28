extends Button

func _on_pressed():
	GameManager.game_paused = !GameManager.game_paused
