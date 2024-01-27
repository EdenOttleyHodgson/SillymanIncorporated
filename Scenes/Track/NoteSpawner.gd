extends Node

@export var note_scene : PackedScene

var example_dict = {}

func	 _ready():
	import_resources_data()
	$StartTimer.start()
	

func _on_start_timer_timeout():
	$NoteTimer.start(5.0)

func _on_note_timer_timeout():
	var note = note_scene.instantiate()
	add_child(note)

func import_resources_data():
	var file = FileAccess.open("res://Assets/Tracks/example.txt", FileAccess.READ)
 
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		example_dict[example_dict.size()] = data_set
 
	file.close()
	print(example_dict)
