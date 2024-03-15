extends Node2D

#Open link to www.sportsmate.no website
func _on_sportsmate_link_pressed():
	OS.shell_open("https://www.sportsmate.no")

#Open link to www.funkweb.no website
func _on_funkweb_link_pressed():
	OS.shell_open("https://www.funkweb.no")
