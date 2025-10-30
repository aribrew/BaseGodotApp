extends Node

const InputHelpers = preload ("res://code/helpers/Input.gd")




func _ready () -> void:
	InputHelpers.map_action_key ("quit", KEY_ESCAPE)
	InputHelpers.map_action_key ("quit", KEY_Q, true)

	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed ("quit"):
		GlobalSpace.quit ()

	 
func _process (delta: float) -> void:
	pass


func _notification (what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		GlobalSpace.quit ()
