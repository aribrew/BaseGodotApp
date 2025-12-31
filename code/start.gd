extends Node2D

# Loads an external script is needed before instancing it
const HelloWorld = preload ("res://code/examples/helloworld.gd")


func _ready () -> void:
	InputHelpers.map_action_key ("quit", KEY_ESCAPE)
	InputHelpers.map_action_key ("quit", KEY_Q, true)

	self.add_child (HelloWorld.new())


func _input(event: InputEvent) -> void:
	if event.is_action_pressed ("quit"):
		GlobalSpace.quit ()
		
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
		GlobalSpace.quit ()
