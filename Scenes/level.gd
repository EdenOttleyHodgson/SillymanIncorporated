extends Node2D
var health = 50
var maxHealth = 100
var totalScore = 0
var combo = 0
var healthBarSize
var hpDrain = 0.1
var mood # 1 = sad, 2= normal, 3 = happy

# Called when the node enters the scene tree for the first time.
func _ready():
	$audience.play()
	$king.play("bored")
	healthBarSize = $health.size.x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health > 0:
		health -= hpDrain
		$health.size.x = (health/100)*healthBarSize
	elif health <= 0:
		health = 0
	if health >= 66 && mood != 3:
		$king.play("happy")
		mood = 3
	elif health < 66 && mood != 1:
		$king.play("bored")
		mood = 1
		

	

func _on_tracks_hit(score):
	totalScore += score
	combo += 1
	if score == 300:
		health += 20
	elif  score == 100:
		health += 10
	else:
		health += 5
		
	if health > maxHealth:
		health = maxHealth
	
	$score.text = "Score: " + str(totalScore)
	$combo.text = str(combo) + "x"


func _on_tracks_miss():
	combo = 0
	health -= 10
	$combo.text = str(combo) + "x"
