extends Node2D

class_name HelloWorld

const Types = preload ("res://code/helpers/Types.gd")
const DisplayHelpers = preload ("res://code/helpers/Display.gd")
const InputHelpers = preload ("res://code/helpers/Input.gd")

var text: Label
var text_move_speed: int = 50




func _ready () -> void:
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

	 
func _process (delta: float) -> void:
	if Input.is_action_pressed ("up"):
		text.position.y -= (text_move_speed * delta)

	if Input.is_action_pressed ("down"):
		text.position.y += (text_move_speed * delta)

	if Input.is_action_pressed ("left"):
		text.position.x -= (text_move_speed * delta)
				
	if Input.is_action_pressed ("right"):
		text.position.x += (text_move_speed * delta)
