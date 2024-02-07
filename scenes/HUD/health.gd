extends Label

var health_icon : String = '❤'
var heart_amount : int = 3
func _ready():
	for heart in range(heart_amount):
		text += health_icon 

func _on_hit(_from, _to):
	# Removes a heart at index 0
	text = text.erase(0)

func _on_health_upgrade_detected(amount):
	# No string multiplication in godot
	for i in range(amount):
		text += health_icon
	print('increasing health')
