extends Control
# kart hvor spiller velger bane

func _ready():
	pass

func _on_back_button_pressed():
	$".".hide()

func _on_cutscene_button_pressed():
	# pass på at denne peker på riktig scene
	get_tree().change_scene_to_file("res://cutscene.tscn")

func _on_forest_button_pressed():
	# pass på at denne peker på riktig scene
	# Byttet denne til test levelen for nå
	get_tree().change_scene_to_file("res://scenes/test_level.tscn")
	#get_tree().change_scene_to_file("res://forest_level.tscn")

func _on_mountain_button_pressed():
	# pass på at denne peker på riktig scene
	get_tree().change_scene_to_file("res://scenes/maps/w1m1.tscn")
