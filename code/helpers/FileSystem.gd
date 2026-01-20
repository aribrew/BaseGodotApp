class_name FileSystemHelpers

# Helpers for working with the FileSystem specifically


class DirEntry:
	var __path: String = ""
	var __size: int = -1
	var __is_dir: bool = false
	var __is_executable: bool = false
	var __is_valid: bool = false
	
	func _init (path: String) -> void:
		var dir = DirAccess.open (path)
		
		if dir != null:
			__is_dir = true
			__is_valid = true
			
		else:
			var file = FileAccess.open (path, FileAccess.READ)
			
			if file != null:
				__path = file.get_path_absolute ()
				__size = FileAccess.get_size (__path)
				
				var magic_number = []
				magic_number.append (file.get_8())
				magic_number.append (file.get_8())
				magic_number.append (file.get_8())
				magic_number.append (file.get_8())
				file.close ()
				
				if (magic_number[0] == 77) and (magic_number[1] == 90):
					__is_executable = true # Windows EXE magic number found
				
				if (magic_number[0] == 127) and (magic_number[1] == 69) and \
				   (magic_number[2] == 76) and(magic_number[3] == 70):
					__is_executable = true # Linux ELF magic number found
					
				__is_valid = true
				
				
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
		
