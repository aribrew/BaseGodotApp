extends Node2D

const InputHelpers = preload ("res://code/helpers/Input.gd")

#const HelloWorld = preload ("res://code/examples/helloworld.gd")
#const TimerExample = preload ("res://code/examples/timer_example.gd")
const Example = preload ("res://code/examples/tilemap_example.gd")


func _ready () -> void:
	InputHelpers.map_action_key ("quit", KEY_ESCAPE)
	InputHelpers.map_action_key ("quit", KEY_Q, true)

#	self.add_child (HelloWorld.new())
#	self.add_child (TimerExample.new())
	self.add_child (Example.new())


func _input(event: InputEvent) -> void:
	if event.is_action_pressed ("quit"):
		GlobalSpace.quit ()

 
func _process (delta: float) -> void:
	pass


func _notification (what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		GlobalSpace.quit ()
