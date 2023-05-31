class_name Biodeg
extends Area2D

var trashtype = "biodeg"

func get_type():
	return trashtype


func _on_Biodegradable_Trash_Can_mouse_entered():
	$Label.show()


func _on_Biodegradable_Trash_Can_mouse_exited():
	$Label.hide()
