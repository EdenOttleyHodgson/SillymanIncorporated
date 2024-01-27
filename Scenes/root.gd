extends Node2D

var level
# Called when the node enters the scene tree for the first time.
func _ready():
	level = preload("res://Scenes/level.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_menu_cont():
	$menu.visible = false
	add_child(level.instantiate())
