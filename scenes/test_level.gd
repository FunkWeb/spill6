extends Node2D

# Viser label og "dreper" player om noen av disse skjer.

func _on_death_pit_detected(_self, body):
	body.queue_free()
	$HUD/CenterContainer/game_over.show()

func _on_goal_detected(_self, body):
	body.queue_free()
	$HUD/CenterContainer/you_win.show()

func _on_player_death(body):
	body.queue_free()
	$HUD/CenterContainer/you_died.show()
