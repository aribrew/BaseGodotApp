extends Node

var UI: CanvasLayer = null
var World: Node2D = null
var SubScenes: Node2D = null


func _ready () -> void:	
	UI = $UI
	World = $World
	SubScenes = $SubScenes
 

func _process (_delta: float) -> void:
	pass


func __spawn (entity: Node2D) -> void:
	World.add_child (entity)
	
	
