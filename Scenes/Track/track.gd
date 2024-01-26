extends Area2D
signal hit
var notesInside
# Called when the node enters the scene tree for the first time.
func _ready():
	notesInside = []
	pass

func _input(event):
	if event.is_action_pressed("hit_note1"):
		if len(notesInside) > 0:
			notesInside.pop_front().free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	notesInside.append(area)
	print(notesInside)

func _on_area_exited(area):
	notesInside.erase(area)
	print(notesInside)

