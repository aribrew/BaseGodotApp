extends Node

var __scenes: Dictionary = {}

var __changing_scene: bool = false
var __new_scene = null

var __current_root = null


func _ready() -> void:
	SceneManager.__current_root = get_tree()


func _process (_delta: float) -> void:
	if SceneManager.__changing_scene:
		SceneManager.__current_root.change_scene_to_file (
			SceneManager.__new_scene
		)
		
		SceneManager.__new_scene = null
		SceneManager.__changing_scene = false


func _notification (what):		
	if what == NOTIFICATION_SCENE_INSTANTIATED:
		SceneManager.__current_root = get_tree ()


func CurrentScene ():
	return __current_root
	

func SceneNames () -> Array:
	return __scenes.keys()
	

func Load (scene_name) -> bool:
	if not __scenes.has (scene_name):
		return false
		
	__changing_scene = true
	__new_scene = __scenes[scene_name]
	return true

	
func Register (scene_name, scene_file) -> bool:
	if not ResourceLoader.exists (scene_file):
		return false
	
	if __scenes.has (scene_name):
		return false
		
	__scenes[scene_name] = scene_file
	return true
