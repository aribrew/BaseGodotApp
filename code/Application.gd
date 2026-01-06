extends Node

class_name Application

# This script is auto loaded, and all its functionality
# is available to the entire project.

# For changing scenes in the right moment
static var changing_scene: bool = false
static var new_scene = null

# Allows accessing the root node statically
static var current_root = null


func _ready () -> void:
	Application.current_root = get_tree()
	
	InputHelpers.map_action_key ("quit", KEY_ESCAPE)
	InputHelpers.map_action_key ("quit", KEY_Q, true)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed ("quit"):
		Application.quit ()
		
	elif event is InputEventMouseButton:
		if event.pressed:
			pass
		else:
			pass
			
	elif event is InputEventScreenTouch:
		if event.pressed:
			pass
		else:
			pass


func _process (_delta: float) -> void:
	if Application.changing_scene:
		Application.current_root.change_scene_to_file (Application.new_scene)
		Application.new_scene = null
		Application.changing_scene = false


func _notification (what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		Application.quit ()
		
	elif what == NOTIFICATION_SCENE_INSTANTIATED:
		Application.current_root = get_tree ()
		

# Helper for changing scenes.
# If the scene file exists, the change will happen in the next frame
static func change_scene (scene_file) -> bool:
	if ResourceLoader.exists (scene_file):
		Application.changing_scene = true
		Application.new_scene = scene_file
		return true
	
	return false


# Closes application
static func quit () -> void:
	Application.current_root.quit()
