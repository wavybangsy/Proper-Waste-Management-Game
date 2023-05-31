extends Node2D

var selected = false
var pos;
var Biodegradable

func _ready():
	pos = position
	$Label.hide()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Drag"):
		selected = true
	if Input.is_action_just_released("Release"):
		selected = false
		global_position = pos
		
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false

func _on_Area2D_area_entered(area):
	#Biodegradable = area as Biodeg
	#if Biodegradable.get_type() == "biodeg": 
		#global_position = pos
	#elif Biodegradable.get_type() == "nonbiodeg":
		#global_position = pos
	#elif Biodegradable.get_type() == "recylable":
		$Correct.play()
		yield(get_tree().create_timer(0.1),"timeout")
		queue_free() 
	

func _on_Area2D_body_entered(body):
	if body.is_in_group ("Recy") || body.is_in_group("Non"):
		$Label.show()
		$Wrong.play()
		
func _on_Area2D_body_exited(body):
		$Label.hide()
		$Wrong.stop()

func _on_Area2D_mouse_entered():
	$Label2.show()

func _on_Area2D_mouse_exited():
	$Label2.hide()
