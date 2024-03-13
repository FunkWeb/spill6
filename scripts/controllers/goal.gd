extends Node2D
# TODO
# Label må vises i midten av cameraet. 

signal won_game

func _on_area_2d_body_exited(body):
	# Ser om body er en spiller, stopper spilleren, spiller idle animasjon(eller victory)
	# Stopper game timer
	# Viser Level Complete label men ikke i riktig posisjon. Må fikses etterhvert
	# 2 sekunder går og scenen endres til menyen igjen.
	if body.get_class() == "CharacterBody2D":
		$"../../HUD/RightContainer/PauseButton".hide() #Hide the pause button from player on win
		body.velocity.x = 0
		body.scroll_speed = 0
		# body.anim_player.play('idle')
		won_game.emit()
		GameManager.disconnect_pause_function()
		SoundManager.vinn_bane()
		$"../../HUD/CenterContainer/you_win".show()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

