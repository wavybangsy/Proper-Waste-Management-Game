extends Node2D


#func _ready():
#	$Label.hide()
	
func _draw():
	draw_circle(Vector2.ZERO, 10, Color.white)
	

#
#func _on_Area2D_area_entered(area):
#	if area.is_in_group("Bio") || area.is_in_group("Non"):
#		$Label.show()
