extends Node2D
var health = 50
var maxHealth = 100
var totalScore = 0
var combo = 0
var healthBarSize
var hpDrain = 0.1
var mood # 1 = sad, 2= normal, 3 = happy

signal finished(score: int, died: bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	$audience.play()
	$king.play("bored")
	healthBarSize = $health.size.x
	$hit_effect.modulate.a = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health > 0:
		health -= hpDrain
		$health.size.x = (health/100)*healthBarSize
	elif health <= 0:
		health = 0
		emit_signal("finished", totalScore, true)
	if health >= 66 && mood != 3:
		$king.play("happy")
		mood = 3
	elif health < 66 && mood != 1:
		$king.play("bored")
		mood = 1
	$hit_effect.modulate.a -= 0.03
		

	

func _on_tracks_hit(score):
	totalScore += score
	combo += 1
	if score == 300:
		health += 20
		$hit_effect.get_node("effect").texture = preload("res://Assets/art/Hilarious.png")
	elif  score == 100:
		health += 10
		$hit_effect.get_node("effect").texture = preload("res://Assets/art/Funny.png")
	else:
		health += 5
		$hit_effect.get_node("effect").texture = preload("res://Assets/art/Tragic.png")
		
	if health > maxHealth:
		health = maxHealth
	$hit_effect.modulate.a = 1
	$score.text = "Score: " + str(totalScore)
	$combo.text = str(combo) + "x"


func _on_tracks_miss():
	combo = 0
	health -= 10
	$combo.text = str(combo) + "x"


func _on_tracks_tracks_finished():
	emit_signal("finished", totalScore, false)
