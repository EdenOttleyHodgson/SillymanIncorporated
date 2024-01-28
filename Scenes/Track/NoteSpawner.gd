extends Node

@export var note_scene : PackedScene
@export var tomato_scene : PackedScene
var paused = false
var count = 0
var spawnType
var track
var currentNotes = []
var tomatoCount = 5
var rng = RandomNumberGenerator.new()
signal finished
func start(notes):
	track = notes
	$NoteTimer.start(float(0))
	var randomInt = rng.randf_range(1,20)
	var rangy = (0.5 * ((2*randomInt)-1)) + 1.0
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
				var currentNote = note_scene.instantiate()
				add_child(currentNote)
				currentNotes.append(currentNote)
			$NoteTimer.set_wait_time(note_time)
	else:
		emit_signal("finished")
		$NoteTimer.stop()

func pauseSpawner():
	$NoteTimer.set_paused(true)
	pauseNotes()
func unpauaseSpawner():
	$NoteTimer.set_paused(false)
	pauseNotes()

func pauseNotes():
	if len(currentNotes) > 0:
		for i in currentNotes:
			i.pause()
func removeNote():
	currentNotes.pop_front()

func _on_tomato_chance_timer_timeout():
	if tomatoCount > 0:
		add_child(tomato_scene.instantiate())
		tomatoCount -= 1
		$TomatoChanceTimer.start(1.0)
	else:
		var randomInt = rng.randf_range(1,20)
		var rangy = (0.5 * ((2*randomInt)-1)) + 5.0
		$TomatoChanceTimer.start(rangy)
