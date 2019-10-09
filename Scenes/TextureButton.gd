extends TextureButton


func _on_TextureButton_button_down():
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
