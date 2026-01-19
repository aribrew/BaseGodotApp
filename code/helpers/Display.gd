class_name DisplayHelpers


static func resolution () -> Types.Size:
	var screen_size = DisplayServer.screen_get_size()

	var res = Types.Size.new()
	res.width = screen_size[0]
	res.height = screen_size[1]

	return res


static func set_clear_color (color: Color) -> void:
	RenderingServer.set_default_clear_color (color)
