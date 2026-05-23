extends Window
var tNum =6
var pNum =3
var mNum =5
var blad: bool = true
var jmad: bool = true
var rya9h: bool = true
var hywan: bool = true
var amakn: bool = true
var tn8l: bool = true
func _ready() -> void:
	position = Vector2i(10000,10000)
	new_project.blad = true
	new_project.jmad = true
	new_project.rya9h = true
	new_project.hywan = true
	new_project.amakn = true
	new_project.tn8l = true
func _on_countries_toggled(toggled_on: bool) -> void:
	$"../ClickSound".play()
	if toggled_on:
		new_project.blad = true
		new_project.tNum=new_project.tNum+1
	else:
		new_project.blad = false
		new_project.tNum=new_project.tNum-1


func _on_objects_toggled(toggled_on: bool) -> void:
	$"../ClickSound".play()
	if toggled_on:
		new_project.jmad = true
		new_project.tNum=new_project.tNum+1
	else:
		new_project.jmad = false
		new_project.tNum=new_project.tNum-1


func _on_sports_toggled(toggled_on: bool) -> void:
	$"../ClickSound".play()
	if toggled_on:
		new_project.rya9h = true
		new_project.tNum=new_project.tNum+1
	else:
		new_project.rya9h = false
		new_project.tNum=new_project.tNum-1


func _on_animals_toggled(toggled_on: bool) -> void:
	$"../ClickSound".play()
	if toggled_on:
		new_project.hywan = true
		new_project.tNum=new_project.tNum+1
	else:
		new_project.hywan = false
		new_project.tNum=new_project.tNum-1


func _on_places_toggled(toggled_on: bool) -> void:
	$"../ClickSound".play()
	if toggled_on:
		new_project.amakn = true
		new_project.tNum=new_project.tNum+1
	else:
		new_project.amakn = false
		new_project.tNum=new_project.tNum-1


func _on_transportation_toggled(toggled_on: bool) -> void:
	$"../ClickSound".play()
	if toggled_on:
		new_project.tn8l = true
		new_project.tNum=new_project.tNum+1
	else:
		new_project.tn8l = false
		new_project.tNum=new_project.tNum-1



func _on_confirm_pressed() -> void:
	$"../ClickSound".play()
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://PlayMenu.tscn")
