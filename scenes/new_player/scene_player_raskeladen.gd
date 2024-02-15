extends CharacterBody2D

var wheels = [] 
var max_speed = 50
@export var speed : float = 300.0
@export var jump_velocity: float = -450.0
@export var double_jump_velocity: float = - 350.0
@export var scroll_speed : float = 0
@onready var anim_player : AnimationPlayer = $AnimationPlayer

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped : bool = false
var has_landed : bool = false
var animation_locked : bool = false
var hearts : int = 3

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")

func _physics_process(delta):
	position.x += scroll_speed * delta
	if not is_on_floor():
		velocity.y += gravity * delta

	# Har satt jump til space for nå, vi må endre det til en knapp
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			has_double_jumped = false
			anim_player.play('jump_start')
			velocity.y = jump_velocity
			
		elif not has_double_jumped:
			has_double_jumped = true
			anim_player.play('jump_start')
			velocity.y = double_jump_velocity
	
