extends Node
# hovedmenyen på spillet
@onready var level_select = $LevelSelect
@onready var settings = $Settings
@onready var credits = $Credits
func _ready():
	print("menu loaded")
	GameManager.connect_pause_function()
	GameManager.game_paused = false
	SoundManager.play_bird_chirp_loop(true)

	# henter versjon nummer fra version.txt og oppdaterer VersionLabel
	var file = FileAccess.open("res://version.txt", FileAccess.READ)
	var content = file.get_as_text(true).replace("\n","")
	$VersionLabel.text = content
	
func _on_start_button_pressed():
	level_select.show()
	SoundManager.start_button()

func _on_settings_button_pressed():
	settings.show()

func _on_credits_button_pressed():
	credits.visible = true

func _on_quit_button_pressed():
	get_tree().quit()

func _input(event):
	# kun for testing i windows, trengs ikke i ferdig produkt
	if event.is_action_pressed("ui_cancel"):
		if level_select.visible == true:
			level_select.hide()
		elif settings.visible == true:
			settings.hide()
		elif credits.visible == true:
			credits.hide()
		else:
			_on_quit_button_pressed()

func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		# android back button
		if level_select.visible == true:
			level_select.hide()
		elif settings.visible == true:
			settings.hide()
		elif credits.visible == true:
			credits.hide()
		else:
			_on_quit_button_pressed()
