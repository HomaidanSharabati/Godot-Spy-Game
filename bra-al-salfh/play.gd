extends TextureButton


func _on_pressed() -> void:
	$"../ClickSound".play()
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://PlayMenu.tscn")
	
