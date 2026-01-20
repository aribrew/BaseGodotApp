class_name SystemHelpers


class DirEntry:
	var __path: String = ""
	var __is_dir: bool = false


static func list_dir (path: String):
	if path == null:
		return null
		
	var dir = DirAccess.open (path)
		
	if dir == null:
		return null
		
	var folders = dir.get_directories()
	var files = dir.get_files()
	var contents: PackedStringArray
	
	for d in folders:
		contents.append(d)
		
	for f in files:
		contents.append(f)
	
	return contents
	

static func test ():
	var path = "/home/javier"
	var dir_contents = list_dir (path)
	
	if dir_contents != null:
		print ("Listing '{0}' contents: ".format([path]))
		print ("-------------------------")
		
		for item in dir_contents:
			print (item)
		
