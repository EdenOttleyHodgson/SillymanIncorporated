extends Area2D
signal hit(score: int)
var notesInside
var hitWidth

# Called when the node enters the scene tree for the first time.
func _ready():
	notesInside = []
	hitWidth = $hitbox.shape.extents.x # would also need to add radius of note

func _input(event):
	if event.is_action_pressed("hit_note1") && get_name() == "track1":
		handle_note()
	if event.is_action_pressed("hit_note2") && get_name() == "track2":
		handle_note()
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	notesInside.append(area)

func _on_area_exited(area):
	notesInside.erase(area)

func handle_note():
	if len(notesInside) > 0:
		var currentNote = notesInside[0]
		var distance = currentNote.global_position.x-global_position.x
		var totalDistance = hitWidth + (currentNote.get_node("CollisionShape2D").shape.radius)/2
		# Define distance ranges for points
		# TODO maybe change range based on speed? - probably convert to time using t=d/s
		var perfect = totalDistance/6
		var okay = totalDistance/3
		if distance > -(perfect) && distance < (perfect): # These numbers will need tweaking
			print("perfect")
			emit_signal("hit", 300)
		elif distance > -(okay) && distance < okay:
			print("okay")
			emit_signal("hit", 100)
		else:
			print("bad")
			emit_signal("hit", 50)
		# Pop note from list and delete it
		notesInside.pop_front().free()
