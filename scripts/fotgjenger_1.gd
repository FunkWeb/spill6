extends Node2D

signal hit(from, to)

func _ready():
	print("fotgjenger 1 loaded")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update animation
	pass
	
func _on_area_2d_area_entered(body):
	# Spilleren treffer hinderet
	emit_signal('hit', self, body)
	SoundManager.skade_piano()

