extends Node2D

class_name TilemapExample




var tile_w: int = 32
var tile_h: int = 32

var tilemap_w: int = 64
var tilemap_h: int = 32

var tilemap: Array


func _ready () -> void:
	var img = Image.new().create_empty (tile_w,
										tile_h,
										false,
										Image.FORMAT_RGB8)
	img.fill (Color.RED)


	var grid = Image.new().create_empty ((tile_w * tilemap_w), 
										 (tile_h * tilemap_h),
										 false,
										 Image.FORMAT_RGB8)

	grid.blend_rect (img,
					 Rect2i (Vector2i (0,0), img.get_size()),
					 Vector2i (0,0))

	var grid_tex = ImageTexture.create_from_image (grid)

	var sprite = Sprite2D.new ()
	sprite.centered = false
	sprite.texture = grid_tex

	add_child (sprite)
	
	print ("Tile map example.")

