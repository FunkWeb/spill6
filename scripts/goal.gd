extends Node2D
# TODO
# Label må vises i midten av cameraet. 

func _on_area_2d_body_exited(body):
	# Ser om body er en spiller, stopper spilleren, spiller idle animasjon(eller victory)
	# Viser Level Complete label men ikke i riktig posisjon. Må fikses etterhvert
	# 2 sekunder går og scenen endres til menyen igjen.
	if body.get_class() == "CharacterBody2D":
		body.scroll_speed = 0
		# body.anim_player.play('idle')
		$LevelCompleteLabel.show()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

