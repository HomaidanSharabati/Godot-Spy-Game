extends Control

var is_initialized : bool = false

func _ready():
	modulate.a = 0.0  # يبدأ شفاف
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.5)  


func _on_play_pressed() -> void:
	$ClickSound.play()
	await get_tree().create_timer(0.25).timeout
	
	get_tree().change_scene_to_file("res://PlayMenu.tscn")


func _on_info_pressed() -> void:
	$ClickSound.play()
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://Info.tscn")

func _on_contact_pressed() -> void:
	$ClickSound.play()
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://Contact.tscn")
