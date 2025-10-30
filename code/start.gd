extends Node




func _ready () -> void:
	pass
	

func _input(event: InputEvent) -> void:
	pass

	 
func _process (delta: float) -> void:
	pass


func _notification (what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		GlobalSpace.quit ()
