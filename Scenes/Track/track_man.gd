extends Area2D
signal hit(score: int)
signal miss
signal hitTomato
signal tracks_finished
enum FINISHED {NONE, ONE, BOTH}
var finished = FINISHED.NONE
@export var note_scene : PackedScene
var pause = false
var example_dict = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	import_resources_data("res://Assets/levels/example.txt")
	$NoteSpawner.start(example_dict[0])
	$NoteSpawner2.start(example_dict[1])

func import_resources_data(fileName):
	var file = FileAccess.open(fileName, FileAccess.READ)
 
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		example_dict[example_dict.size()] = data_set
	file.close()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_track_1_hit(score):
	emit_signal("hit", score)
func _on_track_2_hit(score):
	emit_signal("hit", score)

func _on_killbox_area_entered(area):
	if !area.is_tomato():
		miss.emit()
	area.free()
	$NoteSpawner.removeNote()
func _on_killbox_2_area_entered(area):
	if !area.is_tomato():
		miss.emit()
	area.free()
	$NoteSpawner2.removeNote()
	
func stop():
	pause = true
	$track1.stop()
	$track2.stop()
	$NoteSpawner.pauseSpawner()
	$NoteSpawner2.pauseSpawner()
func play():
	pause = false
	$track1.play()
	$track2.play()
	$NoteSpawner.unpauaseSpawner()
	$NoteSpawner2.unpauaseSpawner()





func _on_track_1_hit_tomato():
	hitTomato.emit()
func _on_track_2_hit_tomato():
	hitTomato.emit()

func _on_note_spawner1_finished():
	finished += 1
	emit_finished()


func _on_note_spawner2_finished():
	finished += 1
	emit_finished()

func emit_finished():
	if finished == FINISHED.BOTH:
		emit_signal("tracks_finished")
