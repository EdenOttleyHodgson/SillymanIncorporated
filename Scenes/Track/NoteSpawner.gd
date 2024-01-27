extends Node

@export var note_scene : PackedScene

var example_dict = {}
var count = 0
var spawnType
var track

func start(notes):
	track = notes
	$NoteTimer.start(float(0))

func _ready():
	pass
	

func _on_note_timer_timeout():
	if count < len(track):
		if track[count] == "n":
			spawnType = "n"
			count += 1
		else:
			var note_time = float(track[count])
			count += 1
			if spawnType == "n":
				add_child(note_scene.instantiate())
			$NoteTimer.set_wait_time(note_time)
	else:
		$NoteTimer.stop()

