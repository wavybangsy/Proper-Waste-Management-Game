class_name nonBiodeg
extends Area2D

var trashtype = "nonbiodeg"

func get_type():
	return trashtype



func _on_NonBiodegradable_Trash_Can_mouse_entered():
	$Label.show()


func _on_NonBiodegradable_Trash_Can_mouse_exited():
	$Label.hide()
