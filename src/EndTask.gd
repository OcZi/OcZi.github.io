extends Node

var catch_input : bool = false : set = set_catch_input
var last_input : bool = true

func set_catch_input(boolean : bool):
	catch_input = boolean

func _input(event):
	if !catch_input:
		return
	
	if !(event is InputEventKey):
		return
	
	if event.echo:
		return
	
	if last_input:
		last_input = false
		return
	
	event.set_pressed(false)
	var tree = get_tree()
	tree.reload_current_scene()
	tree.paused = false
