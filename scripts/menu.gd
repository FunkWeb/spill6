extends Node
# hovedmenyen på spillet
@onready var level_select = $LevelSelect
@onready var settings = $Settings
@onready var credits = $Credits
func _ready():
	print("menu loaded")
	SoundManager.play_background_menu()

func _on_start_button_pressed():
	level_select.show()
	SoundManager.start_button()

func _on_settings_button_pressed():
	settings.show()

func _on_credits_button_pressed():
	credits.visible = true

func _on_quit_button_pressed():
	get_tree().quit()

	# might need to check if settings or LevelSelect is open first
func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST \
	or what == NOTIFICATION_WM_CLOSE_REQUEST:
		# windows close button \ android back button
		if level_select.visible == true:
			level_select.visible = false
		elif settings.visible == true:
			settings.visible = false
		elif credits.visible == true:
			credits.visible = false
		else:
			_on_quit_button_pressed()
