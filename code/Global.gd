extends Node

class_name GlobalSpace

# This is a special script aimed to contain functions that need to be called
# in any scene. It will always autoload.

# Closes application
func quit () -> void:
	get_tree().quit()
