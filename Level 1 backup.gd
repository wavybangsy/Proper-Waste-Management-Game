extends Node2D

var timer
var seconds: int = 5
#var minutes: int = 0
var garbagecollected = 0

func _ready():
#	visible = false
#	countdowntimer = Timer.new()
#	countdowntimer.connect("timeout",self,"_on_timer_timeout")
#	countdowntimer.set_wait_time(3)
#	countdowntimer.set_one_shot(true)
#	add_child(countdowntimer)
#	countdowntimer.start()

#func _on_CountdownTimer_timeout():
#func _on_countdowntimer_timeout():
#	seconds -= 3
#	print(str(seconds))
#	$countdowntimerlabel.set_text(str(minutes, " : ", str(seconds).pad_zeros(2)))
	visible = true
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	timer.set_wait_time(0) #value is in seconds: 600 seconds = 10 minutes
	timer.set_one_shot(false)
	add_child(timer) 
	timer.start() 

func _on_timer_timeout():
	seconds -= 1
#	if seconds == 60:
#		seconds = 0
#		minutes += 1
#	if minutes == 60:
#		minutes  = 0
#	print( minutes, " : ", str(seconds).pad_zeros(2) )
#	$RichTextLabel.set_text(str(minutes, " : ", str(seconds).pad_zeros(2)))
	if seconds == 0:
		visible = false
		get_tree().change_scene("res://Development/Scenes/Levels/Bad Ending.tscn")
	print(seconds)
	$RichTextLabel.set_text(str(seconds))

func _on_Biodegradable_Trash_Can_area_exited(area):
	garbagecollected = $GarbageCounter.text.to_int()
	garbagecollected += 1 
	$GarbageCounter.text = str(garbagecollected)

func _on_NonBiodegradable_Trash_Can_area_exited(area):
	garbagecollected = $GarbageCounter.text.to_int()
	garbagecollected += 1 
	$GarbageCounter.text = str(garbagecollected)

func _on_Recyclable_Trash_Can_area_exited(area):
	garbagecollected = $GarbageCounter.text.to_int()
	garbagecollected += 1 
	$GarbageCounter.text = str(garbagecollected)
