extends Node2D

class_name TimerExample




var countdown: Timer
var total_ticks: int = 10
var current_ticks: int = 0


func _ready () -> void:
	countdown = Timer.new ()
	add_child (countdown)
	
	countdown.wait_time = 1.0
	countdown.one_shot = false
	countdown.timeout.connect (timer_tick)

	print ("Stopping in " + str(total_ticks) + " second/s.\n")
	
	countdown.start ()


func timer_tick () -> void:
	current_ticks += 1

	print (str(total_ticks - current_ticks))
	
	if (current_ticks == total_ticks):
		time_out ()


func time_out () -> void:
	countdown.stop ()
	print ("\nTimeout!\n")
