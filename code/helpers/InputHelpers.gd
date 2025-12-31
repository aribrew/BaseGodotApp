class_name InputHelpers

static func map_action_key (action: String,
							key: Key,
							ctrl: bool = false, 
							alt: bool = false,
							shift: bool = false) -> void:
	"""
	Maps a key to an action.
	- action: The action name. It gets created if not exists.
	- key: The key that will trigger the action.
	- ctrl, alt, shift: Needed modifiers.

	Once the key is mapped, you can check if the action has been
	trigered with 'event.is_action_pressed/released' (in _input functions) or
	'Input.is_action_pressed/released'
	"""   

	var key_event = InputEventKey.new ()

	if not InputMap.has_action (action):
		print ("Created new action '" + action + "'.")
		InputMap.add_action (action)

	key_event.keycode = key
	key_event.ctrl_pressed = ctrl
	key_event.alt_pressed = alt
	key_event.shift_pressed = shift

	if InputMap.action_has_event (action, key_event):
		print ("Key already assigned to action '" + action + "'.")
		return	    

	InputMap.action_add_event (action, key_event)

	print ("Registered '" + str(key_event) + "' to '" + action + "'.")
