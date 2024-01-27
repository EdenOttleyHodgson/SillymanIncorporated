extends Node2D
var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	health -= 1
	$health.size.x = health


func _on_track_hit():
	$score.text = "Score: " + str($track.get_score())
	$combo.text = str($track.get_combo()) + "x"
