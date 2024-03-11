extends CanvasLayer

signal resume

func _ready():
	hide()

func _on_resume_button_pressed():
	resume.emit()
	$".".hide()
	#$Camera2D.enabled = false

func _on_settings_button_pressed():
	$Settings.show()

func _on_quit_button_pressed():
	resume.emit()
	#$Camera2D.enabled = false
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func _on_game_manager_toggle_game_paused(is_paused):
	visible = is_paused
	update_percent()
	#$Camera2D.enabled = true
	#$Camera2D.make_current()

func update_percent():
	var label = get_node("Percent/Label")
	var goal = get_node("/root/THE-MAP/MAP-TRIGGERS/goal")
	var player = get_node("/root/THE-MAP/PLAYER/Raskeladden")
	
	var percent = round((player.position.x / goal.position.x) * 100)
	label.text = str(percent) + "% Ferdig"
	
