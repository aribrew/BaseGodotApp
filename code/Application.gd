extends Node


# This script is auto loaded, and all its functionality
# is available to the entire project.

# Use this dictionary for registering project-wide variables
var GlobalVars = {}

func _ready () -> void:
	SceneManager.init ()
	
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
	pass


func _notification (what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		Application.quit ()


func current_scene () -> Node:
	return SceneManager.current_scene()


func pause ():
	current_scene().get_tree().paused = true
	

func resume ():
	current_scene().get_tree().paused = false


# Closes application
func quit () -> void:
	current_scene().get_tree().quit()
