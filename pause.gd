extends Node2D

@export var pause_action = "pause"

func toggle_pause():
	var tree = get_tree()
	tree.paused = !tree.paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(pause_action):
		toggle_pause()
