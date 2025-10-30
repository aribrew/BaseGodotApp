extends Node2D

const Types = preload ("res://code/helpers/Types.gd")
const DisplayHelpers = preload ("res://code/helpers/Display.gd")
const InputHelpers = preload ("res://code/helpers/Input.gd")

var text: Label
var text_move_speed: int = 50




func _ready () -> void:
	InputHelpers.map_action_key ("quit", KEY_ESCAPE)
	InputHelpers.map_action_key ("quit", KEY_Q, true)
	InputHelpers.map_action_key ("up", KEY_UP)
	InputHelpers.map_action_key ("down", KEY_DOWN)
	InputHelpers.map_action_key ("left", KEY_LEFT)   
	InputHelpers.map_action_key ("right", KEY_RIGHT)

	var screen_res = DisplayHelpers.resolution ()
	
	var img = Image.new().create_empty (screen_res.width,
										screen_res.height,
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

