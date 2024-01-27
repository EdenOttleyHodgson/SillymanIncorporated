extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_pressed("ui_left"):
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_settings_pressed() -> void:
	pass

func _on_new_game_pressed() -> void:
	pass

func _on_continue_pressed() -> void:
	pass
