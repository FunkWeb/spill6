extends Control

func _ready():
	var file = FileAccess.open("res://CREDITS.md",FileAccess.READ)
	var text = file.get_as_text(true)
	$Text.markdown_text = "[center]\n"+text

func _on_close_button_pressed():
	visible = false
