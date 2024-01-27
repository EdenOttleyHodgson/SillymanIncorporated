extends Area2D
signal hit(score: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_track_1_hit(score):
	emit_signal("hit", score)
func _on_track_2_hit(score):
	emit_signal("hit", score)



