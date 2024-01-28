extends Node

@export var note_scene : PackedScene
@export var tomato_scene : PackedScene

var example_dict = {}
var count = 0
<<<<<<< Updated upstream

func	 _ready():
	import_resources_data()
	$NoteTimer.start(0.1)
=======
var spawnType
var track
var tomatoCount = 5
var rng = RandomNumberGenerator.new()

func start(notes):
	track = notes
	$NoteTimer.start(float(0))
	var randomInt = rng.randf_range(1,20)
	var rangy = (0.5 * ((2*randomInt)-1)) + 5.0
	$TomatoChanceTimer.start(rangy)

func _ready():
	pass
	
>>>>>>> Stashed changes

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

<<<<<<< Updated upstream
func import_resources_data():
	var file = FileAccess.open("res://Assets/Tracks/example.txt", FileAccess.READ)
 
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		example_dict[example_dict.size()] = data_set
 
	file.close()
	print(example_dict)
=======


func _on_tomato_chance_timer_timeout():
	if tomatoCount > 0:
		add_child(tomato_scene.instantiate())
		tomatoCount -= 1
		$TomatoChanceTimer.start(1.0)
	else:
		var randomInt = rng.randf_range(1,20)
		var rangy = (0.5 * ((2*randomInt)-1)) + 5.0
		$TomatoChanceTimer.start(rangy)
>>>>>>> Stashed changes
