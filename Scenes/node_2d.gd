extends Node2D
var health = 100
var totalScore = 0
var combo = 0
var healthBarSize
# Called when the node enters the scene tree for the first time.
func _ready():
	healthBarSize = $health.size.x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health > 0:
		health -= .5
		$health.size.x = (health/100)*healthBarSize

func _on_tracks_hit(score):
	totalScore += score
	combo += 1
	if score == 300:
		health += 40
	elif  score == 100:
		health += 20
	else:
		health += 10
		
	if health > 100:
		health = 100
	
	$score.text = "Score: " + str(totalScore)
	$combo.text = str(combo) + "x"



