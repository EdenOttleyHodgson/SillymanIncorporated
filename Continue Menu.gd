extends Node2D

@onready var test = $Test

func _ready():
	test.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_master_slider_drag_ended(value_changed):
	test.play()
	
