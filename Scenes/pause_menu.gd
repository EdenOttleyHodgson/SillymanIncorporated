extends Control

func _on_continue_buttlon_pressed():
	set_process(false)
	visible = false


func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
