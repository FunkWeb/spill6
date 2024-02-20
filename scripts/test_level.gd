extends Node2D
@onready var pause = %Pause
@onready var camera = $Camera2D
@onready var hud = $HUD

func _notification(what):
	# pause / unpause game
	# BUG pause meny is drawn below hud elements
	if what == NOTIFICATION_WM_GO_BACK_REQUEST \
	or what == NOTIFICATION_APPLICATION_PAUSED \
	or what == NOTIFICATION_WM_CLOSE_REQUEST:
		# windows close button / android home button / android back button
		if pause.visible == true:
			hud.show()
			camera.enabled = true
			pause._on_resume_button_pressed()
		else:
			pause.show()
			hud.hide()
			camera.enabled = false
			get_tree().paused = true
