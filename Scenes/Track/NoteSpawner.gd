extends Node

@export var note_scene : PackedScene

var example_dict = {}
var count = 0

func _ready():
	import_resources_data()
	$NoteTimer.start(float((example_dict[count])[0]))
	count += 1

func _on_note_timer_timeout():
	if count < len(example_dict):
		var note = note_scene.instantiate()
		var note_time = float((example_dict[count])[0])
		print(note_time)
		count += 1
		add_child(note)
		$NoteTimer.set_wait_time(note_time)
	else:
		$NoteTimer.stop()

func import_resources_data():
	var file = FileAccess.open("res://Assets/art/Tracks/example.txt", FileAccess.READ)
 
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		example_dict[example_dict.size()] = data_set
 
	file.close()
	print(example_dict)
