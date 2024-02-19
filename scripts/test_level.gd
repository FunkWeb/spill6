extends Node2D
@onready var pause = $Pause
# Viser label og "dreper" player om noen av disse skjer.
# body.queue_free() "sletter" spilleren 

func _on_death_pit_detected(_self, body):
	body.queue_free()
	$HUD/CenterContainer/game_over.show()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_goal_detected(_self, body):
	body.queue_free()
	$HUD/CenterContainer/you_win.show()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_player_death(body):
	body.queue_free()
	$HUD/CenterContainer/you_died.show()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _notification(what):
	# pause / unpause game
	# BUG pause meny isn't centered on camera
	# BUG pause meny is drawn below game assets
	if what == NOTIFICATION_WM_GO_BACK_REQUEST \
	or what == NOTIFICATION_APPLICATION_PAUSED \
	or what == NOTIFICATION_WM_CLOSE_REQUEST:
		# windows close button / android home button / android back button
		if pause.visible == true:
			pause._on_resume_button_pressed()
		else:
			pause.show()
			get_tree().paused = true
