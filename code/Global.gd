extends Node

class_name GlobalSpace

# This script is auto loaded, and all its functionality is available to the
# entire project.




var start = preload ("res://code/start.gd")


# Allows accessing the root node statically
static var project = null


func _ready () -> void:
	GlobalSpace.project = get_tree()


# Closes application
static func quit () -> void:
	GlobalSpace.project.quit()
