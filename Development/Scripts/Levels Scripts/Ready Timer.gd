extends Node2D

var timer
var seconds: int = 4

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	timer.set_one_shot(false)
	add_child(timer) 
	timer.start() 

func _on_timer_timeout():
	seconds -= 1
	if seconds == 0:
		get_tree().change_scene("res://Development/Scenes/Levels/Level 1.tscn")
	print(seconds)
	$Label.set_text(str(seconds))
