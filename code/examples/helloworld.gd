extends Node2D

var text: Label
var text_move_speed: int = 50


func _ready () -> void:
	InputHelpers.map_action_key ("up", KEY_UP)
	InputHelpers.map_action_key ("down", KEY_DOWN)
	InputHelpers.map_action_key ("left", KEY_LEFT)   
	InputHelpers.map_action_key ("right", KEY_RIGHT)
	
	DisplayHelpers.set_clear_color (Color.BLACK)
	
	text = Label.new ()
	text.text = "Hello world!"
	text.add_theme_font_size_override ("font_size", 50)
	
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
