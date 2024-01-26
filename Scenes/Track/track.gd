extends Area2D
signal hit
var notesInside
# Called when the node enters the scene tree for the first time.
func _ready():
	notesInside = []
	pass

func _input(event):
	if event.is_action_pressed("hit_note1"):
		print("fire in the hole")
		if len(notesInside) > 0:
			var distance = notesInside[0].position.x-position.x
			print(distance)
			#Define distance ranges for points
			if distance > -25 && distance < 25:
				print("perfect")
			elif distance > -50 && distance < 50:
				print("okay")
			else:
				print("bad")
			
			# Pop note from list and delete it
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

