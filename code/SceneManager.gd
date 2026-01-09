extends Node

var __scenes: Dictionary = {}

var __scene_change_phase_1: bool = false
var __scene_change_phase_2: bool = false

var __new_scene = null

var __current_scene: Node = null


func _process (_delta: float) -> void:
	## In this second phase, we save the current (new) scenee
	## for later use
	if __scene_change_phase_2:
		__current_scene = get_tree().current_scene
		print ("Changed scene: " + str(__current_scene))
		__new_scene = null
		__scene_change_phase_2 = false
		
	# In the first phase, the new scene is loaded from disc
	# replacing he current one
	if __scene_change_phase_1:
		var loaded = __current_scene.get_tree().change_scene_to_file (
			__new_scene
		)
		
		if loaded != Error.OK:
			print ("Failed loading scene!")
		
		__scene_change_phase_1 = false	
		__scene_change_phase_2 = true
		

func CurrentScene ():
	return __current_scene
	
	
func Init ():
	__current_scene = get_tree().current_scene
	print (str(__current_scene))


## Loads a previously registered scene in a new node
func Instantiate (scene_name, node_name) -> bool:
	if not __scenes.has (scene_name):
		return false
		
	if node_name == "":
		return false
		
	var existing_node = __current_scene.find_child (node_name)
	
	if existing_node != null:
		return false
		
	__current_scene.add_child (__scenes[scene_name])
	return true


## Loads a previously registered scene replacing current one
func Load (scene_name) -> bool:
	if not __scenes.has (scene_name):
		return false
		
	__scene_change_phase_1 = true
	__new_scene = __scenes[scene_name]
	
	return true


## Register a scene file for later use
func Register (scene_name, scene_file) -> bool:
	if not ResourceLoader.exists (scene_file):
		return false
	
	if __scenes.has (scene_name):
		return false
		
	__scenes[scene_name] = scene_file
	
	return true


func SceneNames () -> Array:
	return __scenes.keys()
