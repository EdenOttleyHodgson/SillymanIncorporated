extends Node2D

var score
var acc

signal replay_level
signal main_menu
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func init(newScore, newAcc, died):
	score = newScore
	acc = newAcc
	$ScoreDisplayLabel.text = str(score)
	$AccuracyDisplayLabel.text = str(acc)
	$RankDisplayLabel.text = calculate_rank()
	if died == true:
		$LevelCompleteLabel.text = "Level Failed..."
	
	
func calculate_rank() -> String:
	if score > 2000:
		return "S"
	elif score > 1500:
		return "A"
	elif score > 1000:
		return "B"
	elif score > 500:
		return "C"
	elif score > 250:
		return "D"
	return "D-"
	

# Called every frame. elta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_replay_level_button_pressed():
	emit_signal("replay_level")


func _on_main_menu_button_pressed():
	emit_signal("main_menu")
