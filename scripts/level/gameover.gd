extends Node2D
@onready var camera = $Camera2D
# Viser label og "dreper" om player har sendt ut death signalet
# body.queue_free() "sletter" spilleren 

func _ready():
	SoundManager.play_bird_chirp()

func _on_player_death(body):
	SoundManager.taper_lyd()
	body.queue_free()
	GameManager.disconnect_pause_function()
	get_node("HUD/RightContainer/PauseButton").queue_free()
	$HUD/CenterContainer/you_died.show()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")


func _on_hit(from, to):
	pass # Replace with function body.
