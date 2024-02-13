extends Node2D
# Placeholder enemy for spillet

signal hit(from, to)
# from: entity (self her). Vi kan sende hit signalen til samme sted og heller kategorisere enemies
# kanskje noen har spesielle effekter eller skader mer, det kan vi spesifisere i _on_hit i player

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Legg til tygdekraft
	pass

func _on_area_2d_body_entered(body):
	emit_signal('hit', self, body)
	$Area2D/CollisionShape2D/skadePiano.play()
