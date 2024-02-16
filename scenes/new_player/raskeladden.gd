extends RigidBody2D

@export var speed : float = 300.0
@export var jump_velocity: float = -400.0
@export var double_jump_velocity: float = - 350.0
@export var scroll_speed : float = 0

@onready var anim_player : AnimationPlayer = $AnimationPlayer

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped : bool = false
var has_landed : bool = false
var animation_locked : bool = false
var hearts : int = 3

func _ready():
	print("player loaded")

func _physics_process(delta):
	position.x += scroll_speed * delta
