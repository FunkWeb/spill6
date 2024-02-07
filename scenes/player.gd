extends CharacterBody2D

signal died(body)

@export var speed : float = 300.0
@export var jump_velocity: float = -400.0
@export var double_jump_velocity: float = - 100.0
@export var scroll_speed : float = 100.0
@export var hearts : int = 3

@onready var anim_player : AnimationPlayer = $AnimationPlayer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped : bool = false
var has_landed : bool = false
var animation_locked : bool = false
var hits : int = 0


func _physics_process(delta):
	position.x += scroll_speed * delta
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			has_double_jumped = false
			anim_player.play('jump_start')
			velocity.y = jump_velocity
			
		elif not has_double_jumped:
			has_double_jumped = true
			anim_player.play('jump_start')
			velocity.y = double_jump_velocity
		
	if Input.is_action_just_pressed("duck"):
		anim_player.play('duck')

	has_landed = check_if_landing()
	update_animation()
	move_and_slide()
	
func update_animation():
	if is_on_floor():
		anim_player.play('run')
	else:
		anim_player.play('float')
	
	if has_landed:
		# not working
		anim_player.play('jump_land')

func check_if_landing():
	return (not is_on_floor() and velocity.y > 50)
	
func on_hit(_self, body):	
	hits += 1
	# play hit animation
	# push character back a bit?
	# invincibility, flashing sprite?
	if hits >= hearts:
		die(body)

func die(body):
	emit_signal('died', body)

func _on_health_upgrade_detected(amount):
	hearts += amount
