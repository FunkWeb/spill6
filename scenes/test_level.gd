extends Node2D

# Viser label og "dreper" player om noen av disse skjer.

func _on_death_pit_detected(_self, body):
	body.queue_free()
	$HUD/CenterContainer/game_over.show()
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_goal_detected(_self, body):
	body.queue_free()
	$HUD/CenterContainer/you_win.show()
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_player_death(body):
	body.queue_free()
	$HUD/CenterContainer/you_died.show()
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
