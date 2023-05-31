class_name recyclable
extends Area2D

var trashtype = "recyclable"

func get_type():
	return trashtype


func _on_Recyclable_Trash_Can_mouse_entered():
	$Label.show()


func _on_Recyclable_Trash_Can_mouse_exited():
	$Label.hide()
