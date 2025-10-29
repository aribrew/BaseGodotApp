extends Node2D


var text: Label
var text_move_speed: int = 50



func map_action_key (action: String,
                     key: Key,
                     ctrl: bool = false, 
                     alt: bool = false,
                     shift: bool = false) -> void:

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


func _ready () -> void:
	map_action_key ("quit", KEY_ESCAPE)
	map_action_key ("quit", KEY_Q, true)
	map_action_key ("up", KEY_UP)
	map_action_key ("down", KEY_DOWN)
	map_action_key ("left", KEY_LEFT)
	map_action_key ("right", KEY_RIGHT)

	var img = Image.new ()

	var screen_width = DisplayServer.screen_get_size()[0]
	var screen_height = DisplayServer.screen_get_size()[1]
	
	# Width, Height, create mipmaps, color format
	img = Image.create_empty (screen_width, 
	                          screen_height, 
	                          false, 
	                          Image.FORMAT_RGB8)
	img.fill (Color.BLACK)
    
	var tex = ImageTexture.create_from_image (img)

	var sprite = Sprite2D.new ()
	sprite.texture = tex
	sprite.centered = false

	var theme = Theme.new ()
	theme.set_font_size ("font_size", "Label", 50)

	text = Label.new ()
	text.text = "Hello world!"
	text.theme = theme

	self.add_child (sprite)
	self.add_child (text)

	
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
	if event.is_action_pressed ("quit"):
		quit ()


func _unhandled_input (event: InputEvent) -> void:
	pass

	
func _unhandled_key_input (event: InputEvent) -> void:
	pass

	 
func _process (delta: float) -> void:
	if Input.is_action_pressed ("up"):
		text.position.y -= (text_move_speed * delta)

	if Input.is_action_pressed ("down"):
		text.position.y += (text_move_speed * delta)

	if Input.is_action_pressed ("left"):
		text.position.x -= (text_move_speed * delta)
	    		
	if Input.is_action_pressed ("right"):
		text.position.x += (text_move_speed * delta)
	
	#pass # App updates here

	
func _physics_process (delta: float) -> void:
	pass # Update physics here


func _notification (what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		quit ()
        

# Closes application
func quit () -> void:
	get_tree().quit()

