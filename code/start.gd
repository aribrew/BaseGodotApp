extends Node2D




func _ready () -> void:
	print ("Hello world!")
	var img = Image.new()

	
func _draw () -> void:
	pass # Used to draw things programatically


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
	pass # App updates here

	
func _physics_process (delta: float) -> void:
	pass # Update physics here
