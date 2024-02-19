extends Node2D
# TODO
# Label må vises i midten av cameraet. 

func _on_area_2d_body_entered(body):
	# Ser om body er en spiller, stopper spilleren, spiller idle animasjon(eller victory)
	# Viser Level Complete label men ikke i riktig posisjon. Må fikses etterhvert
	# 2 sekunder går og scenen endres til menyen igjen.
	if body.get_class() == "CharacterBody2D":
		body.queue_free()
		# body.anim_player.play("death")
		# Vi må finne camera i levelen og presentere label i midten, usikker på hvordan
		$YouDiedLabel.show()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
