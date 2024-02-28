extends CharacterBody2D

signal has_died(body)
# TODO
# Legg til relevant bevegelse
# Ask if doublejump is something we should add
# Clean up code and add documentation

@export var speed : float = 300.0
@export var jump_velocity: float = -450.0
@export var double_jump_velocity: float = - 350.0
@export var scroll_speed : float = 0

@onready var anim_player : AnimationPlayer = $AnimationPlayer

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_landed : bool = false
var animation_locked : bool = false
var hearts : int = 3

func _ready():
	print("player loaded")

func _physics_process(delta):
	position.x += scroll_speed * delta
	if not is_on_floor():
		velocity.y += gravity * delta
	has_landed = check_if_landing()
	update_animation()
	move_and_slide()

func update_animation():
	if is_on_floor():
		anim_player.play('run')
	else:
		anim_player.play('float')
	if has_landed:
		# Funker ikke 
		anim_player.play('jump_land')

func check_if_landing():
	return (not is_on_floor() and velocity.y > 50)

func on_hit(entity, body):	
	print('player hit')
	hearts -= 1
	# play hit animation
	# push character back a bit?
	# invincibility, flashing sprite?
	if hearts == 0:
		die(body)

func die(body):
	print('player has died')
	emit_signal('has_died', body)

# Health upgrade?
func _on_health_upgrade_detected(amount):
	print('player received health upgrade')
	hearts += amount

func _on_jump_button_jump():
	if is_on_floor():
		anim_player.play('jump_start')
		velocity.y = jump_velocity
