extends HBoxContainer

# TODO
# Change health icons into images
# Figure out how many "hearts" we're using
# Bytt ut lyden

var heart_full : CompressedTexture2D = preload("res://assets/art/ui/ui_ikon_helse_fylt_tekstur.png")
var heart_empty : CompressedTexture2D = preload("res://assets/art/ui/ui_ikon_helse_tomt_tekstur.png")

func update_health(value):
	for i in get_child_count():
		if value > i:
			get_child(i).texture = heart_full
		else:
			get_child(i).texture = heart_empty

func _on_player_has_died(body):
	# When the player has died, we get the parents all the way to HUD and display
	# You died, the reason for this tedious code is because else it will appear on the top left instead
	body.queue_free()
	get_parent().get_node("CenterContainer/YouDiedLabel").show()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func _on_raskeladden_lost_health(new_health):
	update_health(new_health)
