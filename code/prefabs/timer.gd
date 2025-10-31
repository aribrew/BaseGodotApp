extends Node

export var interval: float = 1.0
export var repeat: int = -1

var enabled: bool = false
var elapsed: float = 1.0
var laps: int = 0




func _ready () -> void:
    # Called when scripts loads
    pass


# The following three functions are used to handle input.
#
# There are three because they have different filtering levels:
# _unhandled_input receives all events not handled by the UI.
# _unhandled_key_input filters all events except keyboard ones.
# 
# Use _input by default, unless you think you need any of the others.

func _input(event: InputEvent) -> void:
	pass


func _unhandled_input (event: InputEvent) -> void:
	pass

	
func _unhandled_key_input (event: InputEvent) -> void:
	pass

	 
func _process (delta: float) -> void:
    if enabled:
    	elapsed += delta

    	if elapsed >= interval:
    		if repeat >= 1:
    			laps += 1

    			if laps == repeat:
    				stop ()
    				
    		stop ()


func _draw () -> void:
    # Used to draw primitives
	pass


func _physics_process (delta: float) -> void:
    # Update physics here
	pass


func reset () -> void:
	elapsed = 0.0
	laps = 0
	

func start () -> void:
	reset ()
	enabled = true


func stop () -> void:
	enabled = false

	
