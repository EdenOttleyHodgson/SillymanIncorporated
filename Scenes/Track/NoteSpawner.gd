extends Node

@export var note_scene : PackedScene

var example_dict = {}
var count = 0

func	 _ready():
	import_resources_data()
	$NoteTimer.start(0.1)

func _on_note_timer_timeout():
	if count < len(example_dict[3]):
		var note = note_scene.instantiate()
		var note_time = example_dict[3]
		print(note_time)
		count += 1
		add_child(note)
		$NoteTimer.set_wait_time(float(note_time[count]))
	else:
		$NoteTimer.stop()

func import_resources_data():
	var file = FileAccess.open("res://Assets/Tracks/example.txt", FileAccess.READ)
 
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		example_dict[example_dict.size()] = data_set
 
	file.close()
	print(example_dict)
