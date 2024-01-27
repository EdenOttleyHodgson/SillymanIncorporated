extends Label

var direction = 1
var startingPos = position.y
var bounceCoef = 0.2

# Called when the node enters the scene tree for the first time.
func _process(delta):
	position.y += bounceCoef * direction
	if ((position.y >= startingPos + 10) or (position.y <= startingPos - 10)):
		bounceCoef = 0.3
	else:
		bounceCoef = 0.6
	if ((position.y >= startingPos + 15) or (position.y <= startingPos - 15)):
		direction = direction * -1
