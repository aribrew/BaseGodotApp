extends Node2D

var UI: CanvasLayer = null
var World: Node2D = null
var SubScenes: Node2D = null


# Loads an external script is needed before instancing it
const HelloWorld = preload ("res://code/examples/helloworld.gd")


func _ready () -> void:
	UI = $UI
	World = $World
	SubScenes = $SubScenes
	
	SubScenes.add_child (HelloWorld.new())

 
func _process (_delta: float) -> void:
	pass
	
	
func __spawn (entity: Node2D) -> void:
	World.add_child (entity)
