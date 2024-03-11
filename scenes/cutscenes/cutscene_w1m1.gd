extends Node2D

# Called when the node enters the scene tree for the first time.
#func _ready():
#	$AnimationPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if (event is InputEventKey or event is InputEventMouseButton or event is InputEventScreenTouch) and event.pressed:
		print(event)
		#$AnimationPlayer.stop()
		_exit_tree()

func _exit_tree():
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/levels/w1m1.tscn")

func _on_animation_player_animation_finished(cutscene_name):
	print("-----", cutscene_name, "-----")
	_exit_tree()
