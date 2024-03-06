extends Control
# kart hvor spiller velger bane

func _ready():
	pass
	# Henter levels_cleared fra save for å vise hvilke baner er låst opp
	#var i = 0
	#for level in $Levels.get_children():
		#i+=1
		#print("level ",i,": ", level)
		#if i not in $LevelData.levels_cleared:
			#level.disabled = true

func _on_back_button_pressed():
	$".".hide()

func _on_cutscene_button_pressed():
	pass # Replace with function body.

func _on_level_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/w1m1.tscn")

func _on_level_2_button_pressed():
	# Byttet denne til test levelen for nå
	get_tree().change_scene_to_file("")

func _on_level_3_button_pressed():
	pass # Replace with function body.
