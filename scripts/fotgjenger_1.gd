extends Node2D

signal hit(from, to)
# Called when the node enters the scene tree for the first time.
func _ready():
	print("fotgjenger 1 loaded") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Update animation
	pass
	

func _on_area_2d_area_entered(body):
	# Spilleren treffer hinderet
	emit_signal('hit', self, body)
	SoundManager.skade_piano()

