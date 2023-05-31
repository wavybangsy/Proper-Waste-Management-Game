extends Node2D

onready var anim = $BigTrashMoving/Sprite/AnimationPlayer
onready var anim2 = $BigTrashMoving2/Sprite/AnimationPlayer
onready var anim3 = $BigTrashMoving3/Sprite/AnimationPlayer
onready var anim4 = $BigTrashMoving4/Sprite/AnimationPlayer
onready var anim5 = $BigTrashMoving5/Sprite/AnimationPlayer


var timer
#note: please set "seconds: int = " to match a dedicated time
var seconds: int = 31
var garbagecollected = 0


func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	timer.set_wait_time(0) #value is in seconds: 600 seconds = 10 minutes
	timer.set_one_shot(false)
	add_child(timer) 
	timer.start()
	
	anim.play("Big Trash Moving")  
	anim2.play("Big Trash Moving")
	$Bottle.hide()					#anim1 and 2
	$Cloth.hide()				
	$"Moldy Bread".hide()			
	$Banana.hide()					#-- anim 1 and 2
	$"Aluminum Can".hide()			# anim 3
	$"Cardboard Box".hide()
	$"Fish Bone".hide()				# ani 4
	$"Paper Stack".hide()
	$"Paper Cup".hide()			#-- anim 4
	$Poop.hide()						# anim 5 -- anim 5
	$"Plastic Bag".hide()
	$BigTrashMoving3.hide()
	$BigTrashMoving4.hide()
	$BigTrashMoving5.hide()
	
	
	yield(get_tree().create_timer(2),"timeout")
	$BigTrashMoving.hide() 
	$BigTrashMoving2.hide()
	$"Moldy Bread".show()
	$Banana.show()
	$Cloth.show() 
	$Bottle.show()
	
	

func _on_timer_timeout():
	seconds -= 1
	if garbagecollected == 17:
		get_tree().change_scene("res://Development/Scenes/Levels/Good Ending.tscn")
	if garbagecollected == 2:
		$BTnot2.hide()
		$BigTrashMoving4.show()
		anim4.play("Big Trash Moving")
		yield(get_tree().create_timer(1),"timeout")
		$BigTrashMoving4.hide()
		$"Fish Bone".show()
		$"Paper Stack".show()
		$"Paper Cup".show()
	if garbagecollected == 5:
		$BTidle3.hide()
		$BTidle2.hide()
		$BigTrashMoving3.show()
		anim3.play("Big Trash Moving")
		yield(get_tree().create_timer(1),"timeout")
		$BigTrashMoving3.hide()
		$"Aluminum Can".show()
		$"Cardboard Box".show()
	if garbagecollected == 8:
		$BTidle.hide()
		$BigTrashMoving5.show()
		anim5.play("Big Trash Moving")
		yield(get_tree().create_timer(1),"timeout")
		$BigTrashMoving5.hide()
		$Poop.show()
		$"Plastic Bag".show()
	if garbagecollected == 6:
		$BG_2.show()
		$BG_1.hide()
	if garbagecollected == 12:
		$BTidle4.hide()
	if garbagecollected == 15:
		$BG_3.show()
		$BG_2.hide()
	if seconds == 0:
		visible = false
		get_tree().change_scene("res://Development/Scenes/Levels/Bad Ending.tscn")
	print("Time Left: " + str(seconds))
	print("Garbage Collected: " + str(garbagecollected))
	$Timer.set_text(str(seconds))

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

