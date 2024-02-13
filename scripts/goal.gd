extends Node2D

signal detected(from, to)

# Signal that the player is at the goal
func _on_area_2d_body_entered(body):
	emit_signal('detected', self, body)
