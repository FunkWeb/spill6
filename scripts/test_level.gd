extends Node2D
@onready var camera = $Camera2D
@onready var hud = $HUD
# Viser label og "dreper" om player har sendt ut death signalet
# body.queue_free() "sletter" spilleren 

func _on_player_death(body):
	body.queue_free()
	$HUD/CenterContainer/YouDiedLabel.show()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
