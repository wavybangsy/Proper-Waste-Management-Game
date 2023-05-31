extends Node2D

func _on_PLAY_AGAIN_pressed():
	get_tree().change_scene("res://Development/Scenes/Levels/Ready Timer.tscn")
	pass

func _on_MAIN_MENU_pressed():
	get_tree().change_scene("res://Development/Scenes/Levels/Main.tscn")
	pass
