extends Node


# This script is auto loaded, and all its functionality
# is available to the entire project.


func _ready () -> void:
	SceneManager.Init ()
	
	InputHelpers.map_action_key ("quit", KEY_ESCAPE)
	InputHelpers.map_action_key ("quit", KEY_Q, true)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed ("quit"):
		Application.Quit ()

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
		Application.Quit ()


func CurrentScene () -> Node:
	return SceneManager.CurrentScene()


func Pause ():
	CurrentScene().get_tree().paused = true
	

func Resume ():
	CurrentScene().get_tree().paused = false


# Closes application
func Quit () -> void:
	CurrentScene().get_tree().quit()
