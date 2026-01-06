extends Node2D

# Loads an external script is needed before instancing it
#const HelloWorld = preload ("res://code/examples/helloworld.gd")


func _ready () -> void:	
	# Instance a loaded object
	#self.add_child (HelloWorld.new())
	
	# Switch scenes
	Application.change_scene (
		"res://scenes/pick_project_type/pick_project_type.tscn"
	)

 
func _process (_delta: float) -> void:
	pass
