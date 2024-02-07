extends Node2D

signal detected(from, to)

# Signals that the player is in the death pit 
func _on_area_2d_body_entered(body):
	emit_signal('detected', self, body)
