extends Label

# TODO
# Change health icons into images
# Figure out how many "hearts" we're using
# Bytt ut lyden

var health_icon : String = '❤'
var empty_health_icon : String = '🖤'
var heart_amount : int = 3

func _ready():
	connect("lost_health", _on_hit)
	for heart in range(heart_amount):
		text += health_icon 

func _on_hit(_from, _to):
	# Removes a heart at index 0, replaces it with an empty heart
	text = text.erase(0)
	text += empty_health_icon

func _on_player_has_died(body):
	# When the player has died, we get the parents all the way to HUD and display
	# You died, the reason for this tedious code is because else it will appear on the top left instead
	SoundManager.fall_fail()
	body.queue_free()
	get_parent().get_node("CenterContainer/YouDiedLabel").show()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func _on_health_upgrade_detected(amount):
	# No string multiplication in godot
	for i in range(amount):
		text += health_icon
	print('increasing health')
