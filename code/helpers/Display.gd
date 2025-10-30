class_name DisplayHelpers

const Types = preload ("res://code/helpers/Types.gd")

static func resolution () -> Types.Size:
    var screen_size = DisplayServer.screen_get_size()

    var res = Types.Size.new()
    res.width = screen_size[0]
    res.height = screen_size[1]

    return res
