extends Node2D

class_name TimerExample




var timer: Timer
var countdown: int = 10


func _ready () -> void:
	timer = Timer.new ()
	timer.wait_timer = 1.0
	timer.one_shot = false
	timer.timeout.connect (update_countdown)

	timer.start ()


func update_countdown () -> void:
	countdown -= 1

	print ("Counting: " + str(countdown))

	if countdown == 0:
		timer.stop ()


