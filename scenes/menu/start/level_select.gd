extends Node
# kart hvor spiller velger bane

func _ready():
	print("level select loaded")

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_cutscene_button_pressed():
	# pass på at denne peker på riktig scene
	get_tree().change_scene_to_file("res://cutscene.tscn")

func _on_forest_button_pressed():
	# pass på at denne peker på riktig scene
	get_tree().change_scene_to_file("res://scenes/test_level.tscn")
	#get_tree().change_scene_to_file("res://forest_level.tscn")

func _on_mountain_button_pressed():
	# pass på at denne peker på riktig scene
	get_tree().change_scene_to_file("res://mountain_level.tscn")
