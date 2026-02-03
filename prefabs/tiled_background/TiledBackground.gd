extends Node2D

var layers: Node2D = null


func _ready () -> void:
	layers = $Layers
	
	var tilemap = TileMapLayer.new ()
	tilemap.name = "default"
	
	var tileset_source = TileSetAtlasSource.new ()
	
	var tileset = TileSet.new ()
	tileset.add_source (tileset_source, 0)
	
	tilemap.tile_set = tileset
	
	layers.add_child (tilemap)
	

func default_layer () -> TileMapLayer:
	return get_node ("Layers/default")


func layer (layer_name: String) -> TileMapLayer:
	if not layer_exists (layer_name):
		return null
		
	var found_layer: TileMapLayer = get_node ("Layers/" + layer_name)
	return found_layer
	

func layer_exists (layer_name: String) -> bool:
	var node = find_child (layer_name)
	
	if node == null:
		return false
		
	return true


func set_tilesheet_for_layer (tile_sheet: ImageTexture, 
							  layer_name: String = "default",
							  atlas_id: int = 0) -> void:
	if layer_exists (layer_name) and (tile_sheet != null):
		var layer: TileMapLayer = layer (layer_name)
		var tileset_source: TileSetAtlasSource = layer.tile_set.get_source (0)
		
		tileset_source.texture = tile_sheet
		
	
func set_tile_size_for_layer (width: int, 
							  height: int,
							  layer_name: String = "default",
							  atlas_id: int = 0) -> void:
	if (width > 0) and (height > 0) and layer_exists (layer_name):
		var layer: TileMapLayer = layer (layer_name)
		var tile_set: TileSet = layer.tile_set
		var atlas: TileSetAtlasSource = tile_set.get_source (atlas_id)
		
		tile_set.tile_size = Vector2i (width, height)
		atlas.texture_region_size = Vector2i (width, height)
		
		if atlas.texture != null:
			var texture_size: Vector2i = atlas.texture.get_size()
			# TODO: Generate tiles
		
		
		
		
		
