extends Area2D
signal hit
var notesInside
var hitWidth
var score = 0
var combo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	notesInside = []
	hitWidth = $hitbox.shape.extents.x # would also need to add radius of note

func _input(event):
	if event.is_action_pressed("hit_note1"):
		if len(notesInside) > 0:
			var currentNote = notesInside[0]
			var distance = currentNote.position.x-position.x
			var totalDistance = hitWidth + (currentNote.get_node("CollisionShape2D").shape.radius)/2
			# Define distance ranges for points
			# TODO maybe change range based on speed? - probably convert to time using t=d/s
			var perfect = totalDistance/5
			var okay = totalDistance/3
			
			if distance > -(perfect) && distance < (perfect): # These numbers will need tweaking
				print("perfect")
				score += 300
			elif distance > -(okay) && distance < okay:
				print("okay")
				score += 100
			else:
				print("bad")
				score += 50
			combo += 1
			# Pop note from list and delete it
			notesInside.pop_front().free()
			hit.emit()
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	notesInside.append(area)

func _on_area_exited(area):
	notesInside.erase(area)

func get_score():
	return score

func get_combo():
	return combo
