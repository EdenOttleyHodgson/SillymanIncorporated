extends Area2D
var speed = 500
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !paused:
		position.x = position.x - speed * delta

func get_speed():
	return speed

func set_speed(newSpeed):
	speed = newSpeed

func pause():
	paused = !paused

func is_tomato():
	return false
