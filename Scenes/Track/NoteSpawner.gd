extends Node

@export var note_scene : PackedScene
@export var tomato_scene : PackedScene

var example_dict = {}
var count = 0
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

func pauseSpawner():
	$NoteTimer.set_paused(true)
func unpauaseSpanwer():
	$NoteTimer.set_paused(false)
	$NoteTimer.stop()

#<<<<<<< Updated upstream
#func import_resources_data():
	#var file = FileAccess.open("res://Assets/Tracks/example.txt", FileAccess.READ)
 #
	#while !file.eof_reached():
		#var data_set = Array(file.get_csv_line())
		#example_dict[example_dict.size()] = data_set
 #
	#file.close()
	#print(example_dict)
#=======


func _on_tomato_chance_timer_timeout():
	if tomatoCount > 0:
		add_child(tomato_scene.instantiate())
		tomatoCount -= 1
		$TomatoChanceTimer.start(1.0)
	else:
		var randomInt = rng.randf_range(1,20)
		var rangy = (0.5 * ((2*randomInt)-1)) + 5.0
		$TomatoChanceTimer.start(rangy)

