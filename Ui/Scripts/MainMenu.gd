extends Control




func _on_StartButton_pressed() -> void:
	get_tree().change_scene_to_file("res://World/Scenes/Town.tscn")


func _on_OptionButton_pressed() -> void:
	pass


func _on_ExitButton_pressed() -> void:
	get_tree().quit()
