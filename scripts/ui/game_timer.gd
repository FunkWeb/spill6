extends CanvasLayer

#TODO for GameTimer
	# Set Timer-font
	# Set Background frame for timer
	# Make sure it pause properly when game is paused
	# Set good font-size for timer
	# Decide final placement on screen for timer
	# Save time_left as part of score.
	# decide color for timer

@onready var timer = $CenterContainer/Label/Timer
@onready var label = $CenterContainer/Label

signal time_out

@export var time_left = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Set the label text to the current time left on timer
	label.text = get_time()	

func get_time():
	# Divide the given time left into minutes, secounds and milisecounds 
	var current_time = timer.time_left
	var minutes:int = current_time/60
	var secounds:int = fmod(current_time, 60.0)
	var msec:int = fmod(current_time, 1) * 100
	# Convert the integers into string format
	var mins = str(minutes)
	var secs = str(secounds)
	var ms = str(msec)
	# Format the string to a better visiual reprensentation
	if minutes < 10:
		mins = "0" + str(minutes)
	if secounds < 10:
		secs = "0" + str(secounds)
	if msec < 10:
		if msec == 0:
			ms = "00"
		else:
			ms = "0" + str(msec)
	# Return the converted and formated time in a 00:00:00 format
	return str(mins) + ":" + str(secs) + ":" + str(ms)

func _on_timer_timeout():
	# Send signal and transition to GameOver/Retry menu
	emit_signal('time_out')

func time_on_win():
	time_left = get_time()
	print(time_left)
	pass
