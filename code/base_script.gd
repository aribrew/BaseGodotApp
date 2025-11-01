extends Node


func _ready () -> void:
	# Called when scripts loads
	pass


# The following three functions are used to handle input.
#
# There are three because they have different filtering levels:
# _unhandled_input receives all events not handled by the UI.
# _unhandled_key_input filters all events except keyboard ones.
# 
# Use _input by default, unless you think you need any of the others.

func _input(event: InputEvent) -> void:
	pass


func _unhandled_input (event: InputEvent) -> void:
	pass


func _unhandled_key_input (event: InputEvent) -> void:
	pass


func _process (delta: float) -> void:
	# Update things here.
	# Delta is the time passed since the last frame.
	#
	# When moving things, mutiply by the speed to obtain a smooth
	# movement.
	pass


func _draw () -> void:
	# Used to draw primitives
	pass


func _physics_process (delta: float) -> void:
	# Update physics here
	pass

