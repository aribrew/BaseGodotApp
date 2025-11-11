extends Node2D

class_name TilemapExample




var tile_w: int = 32
var tile_h: int = 32


func _ready () -> void:
	var img = Image.new().create_empty (tile_w,
										tile_h,
										false,
										Image.FORMAT_RGB8)
	img.fill (Color.RED)
	
	var tex = ImageTexture.create_from_image (img)

	var tile_set = TileSet.new ()
	tile_set.tile_size = Vector2i (tile_w, tile_h)
	
	var atlas_source = TileSetAtlasSource.new ()
	atlas_source.texture = tex
	atlas_source.texture_region_size = Vector2i (tile_w, tile_h)
	atlas_source.create_tile (Vector2i (0,0))

	tile_set.add_source (atlas_source)

	var tile_map = TileMap.new ()
	tile_map.tile_set = tile_set
	
	add_child (tile_map)

	tile_map.set_cell (0, Vector2i(0,0), 0)

	print ("Tile map example.")

