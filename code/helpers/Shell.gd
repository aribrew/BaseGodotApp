class_name ShellHelpers


class CmdLine:
	"""
	The CmdLine object is intended for executing something that will last
	for no more of one second (preferable less), because the application
	will wait until it completes
	"""
	
	var __exec: String = ""
	var __args: PackedStringArray = []
	var __args_str: String = ""
	var __exit_code: int = -1
	var __stdout: String = ""
	
	
	func _init (command_line: String) -> void:
		if command_line != "":
			var cmdline_chunks = command_line.split(" ")
			__exec = cmdline_chunks[0]
			__args = []
			__args_str = ""
			
			if cmdline_chunks.size() > 1:
				for chunk in cmdline_chunks:
					if chunk == __exec:
						continue
					
					__args.append (chunk)
					__args_str += chunk
					
			__args_str = __args_str.trim_suffix (" ")
	
		
	func execute () -> void:
		__stdout = ""
				
		var process_stdout = []
		__exit_code = OS.execute (__exec, __args, process_stdout, true)
		
		if process_stdout.size() > 0:
			for line in process_stdout:
				__stdout += line
				

	func exit_code () -> int:
		return __exit_code
		
		
	func stdout () -> String:
		return __stdout
		
		
