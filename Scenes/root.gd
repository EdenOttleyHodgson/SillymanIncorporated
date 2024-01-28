extends Node2D

var level
var scoreScreenScene
var active_level
var active_score_screen
var current_score
var died
enum DELETE_ENUM {NONE, LEVEL, SCORE}
var replay_level = false
var should_delete = DELETE_ENUM.NONE
# Called when the node enters the scene tree for the first time.
func _ready():
	level = preload("res://Scenes/level.tscn")
	scoreScreenScene = preload("res://Scenes/ScoreScreen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if should_delete == DELETE_ENUM.LEVEL:
		should_delete = DELETE_ENUM.NONE
		finish_level()
	elif should_delete == DELETE_ENUM.SCORE:
		should_delete == DELETE_ENUM.NONE
		finish_score()
		
		


func _on_menu_cont():
	$menu.visible = false
	active_level = level.instantiate()
	add_child(active_level)
	active_level.finished.connect(_on_finished)
func _on_finished(newScore, newDied):
	current_score = newScore
	died = newDied
	should_delete = DELETE_ENUM.LEVEL
	
func finish_level():
	active_level.free()
	#Display score screen
	active_score_screen = scoreScreenScene.instantiate()
	active_score_screen.init(current_score, -1, died)
	add_child(active_score_screen)
	active_score_screen.replay_level.connect(_on_replay_level)
	active_score_screen.main_menu.connect(_on_main_menu)

func _on_replay_level():
	
	should_delete = DELETE_ENUM.SCORE
	replay_level = true
	
func _on_main_menu():
	
	should_delete = DELETE_ENUM.SCORE
	replay_level = false
	
func finish_score():
	if active_score_screen != null:
		active_score_screen.free()
		print(replay_level)
		if replay_level == true:
			_on_menu_cont()
		else:
			$menu.visible = true
		
