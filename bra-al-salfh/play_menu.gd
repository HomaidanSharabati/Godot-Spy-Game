extends Control



func _ready():
	# اضافة في بداية الملف
	modulate.a = 0.0  # يبدأ شفاف
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.5)  
	
	# يظهر خلال نصف ثانية
# دالة لإنيميشن الضغط على الأزرار
func animate_button(button: Node) -> void:
	var tween = create_tween()
	tween.set_parallel(true) # عشان الأنيميشنات تتسوى مع بعض
	
	# تكبير وتصغير الزر
	tween.tween_property(button, "scale", Vector2(0.6, 0.6), 0.1)
	tween.tween_property(button, "scale", Vector2(0.705, 0.705), 0.1).set_delay(0.1)
	tween.tween_property(button, "modulate", Color(0.8, 0.8, 1.0), 0.1)
	tween.tween_property(button, "modulate", Color(1, 1, 1), 0.1)
	# تغيير شفافية شوي (اختياري)
	tween.tween_property(button, "modulate:a", 0.8, 0.1)
	tween.tween_property(button, "modulate:a", 1.0, 0.1).set_delay(0.1)

func _physics_process(_delta: float) -> void:
	$PlayersNum.text = str(new_project.pNum)
	$MinutesNumber.text = str(new_project.mNum)
	$TopicsNumber.text = str(new_project.tNum)

func _on_minus_pressed() -> void:
	animate_button($Minus) # غير اسم الزر للي عندك
	animate_number_change($PlayersNum)  # اضافة هذا السطر
	if new_project.pNum <= 3:
		# ممكن تضيف صوت خطأ هنا
		return
	else:
		new_project.pNum = new_project.pNum - 1
		# صوت نقر ناجح
		$ClickSound.play()

func _on_positve_pressed() -> void:
	animate_button($Positve) # غير اسم الزر للي عندك
	animate_number_change($PlayersNum)  # اضافة هذا السطر
	if new_project.pNum >= 10:
		return
	else:
		new_project.pNum = new_project.pNum + 1
		$ClickSound.play()

func _on_topics_pressed() -> void:
	animate_button($Topics)
	$ClickSound.play()
	# أنيميشن انتقال سلس
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.3)  # يختفي
	tween.tween_callback(func():
		get_tree().change_scene_to_file("res://Topics.tscn")
		new_project.tNum = 6
	)


func _on_minus_2_pressed() -> void:
	animate_button($Minus2)
	animate_number_change($MinutesNumber)  # اضافة هذا السطر
	if new_project.mNum <= 1:
		return
	else:
		new_project.mNum = new_project.mNum - 1
		$ClickSound.play()

func _on_positve_2_pressed() -> void:
	
	animate_button($Positve2)
	animate_number_change($MinutesNumber)  # اضافة هذا السطر
	if new_project.mNum >= 10:
		return
	else:
		new_project.mNum = new_project.mNum + 1
		$ClickSound.play()

func _on_play_pressed() -> void:
	animate_button($play)
	$ClickSound.play()
	# أنيميشن انتقال للشاشة الرئيسية
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.3)
	tween.tween_callback(func(): 
		get_tree().change_scene_to_file("res://Game.tscn")
	)

func animate_number_change(label: Label):
	var tween = create_tween()
	tween.tween_property(label, "scale", Vector2(1.3, 1.3), 0.1)
	tween.tween_property(label, "scale", Vector2(1.0, 1.0), 0.1)
