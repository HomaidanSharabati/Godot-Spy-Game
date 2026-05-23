extends Control
var players = []
var tries = 0
var spy = 0
var player=1
var topics=[]
var sports = [
  "كرة", "تنس", "سباحة", "ركض", "قفز", "سباق", "ماراثون", "بلياردو", "ملاكمة", "كاراتيه",
  "جودو", "جولف", "رماية", "تزلج", "هوكي", "طائرة", "يد", "باركور", "شطرنج",
  "تسلق", "خيل", "دراجات", "يوغا", "تمارين", "مصارعة"
]

var places = [
  "مدرسة", "مستشفى", "مطعم", "حديقة", "سوق", "مكتب", "مصنع", "مطار", "مكتبة", "جامعة", "شاطئ", "مسجد",
  "كنيسة", "بيت", "مخيم", "ملعب", "متحف", "فندق", "شارع", "مغسلة", "مزرعة", "حديقة", "سوبرماركت",
  "صيدلية", "مخبز", "كراج", "قصر", "كهف", "محطة", "بركة", "سفارة", "مقهى", "جبل"
]

var objects = [
  "كرسي", "طاولة", "قلم", "كتاب", "هاتف", "سيارة", "باب", "نافذة", "حقيبة", "كمبيوتر", "مفتاح", "ساعة",
  "كوب", "طبق", "سكين", "شوكة", "ملعقة", "تلفاز", "ريموت", "مروحة", "وسادة", "بطانية", "كيبورد",
  "ماوس", "ممحاة", "دفتر", "لمبة", "خاتم", "نظارة", "كاميرا", "مايكروفون", "شمعة", "مرآة", "لوحة", "صندوق",
  "شاحن", "عطر", "سماعة", "تيشيرت", "حذاء", "معجون", "فرشاة", "سوار", "سلسلة", "عملة", "محفظة", "مقص",
  "بيتزا", "همبرغر", "رز", "مقلوبة", "كبسة", "منسف", "بطاطا", "شوربة", "سلطة", "شاورما", "كباب", "دجاج",
  "لحم", "سمك", "مكرونة", "سوشي", "كعك", "شوكولاتة", "بوظة", "عصير", "قهوة", "شاي", "حليب", "خبز", "تمر",
  "جبنة", "لبن", "عجة", "زيتون", "حمص", "فلافل", "فطيرة", "كريب", "كنافة", "بسبوسة", "كعكة", "نرد", "ولاعة",
  "منبه", "سجادة", "ستارة", "قفل", "مكواة", "مغناطيس", "سلك", "علبة", "زر", "حبل", "خيط", "لعبة", "إطار",
  "صورة", "كيس", "مشبك", "قرص", "جرس", "شاشة", "بالون", "حذاء", "قبعة", "طربوش", "لوحة", "قرطاس"
]

var countries = [
  "الصين", "البحرين", "الهند", "بريطانيا", "امريكا", "سوريا", "فلسطين", "السعودية", "الأردن", "الإمارات",
  "الكويت", "قطر", "عمان", "مصر", "لبنان", "المغرب", "الجزائر", "تونس", "ليبيا", "تركيا", "اليابان",
  "كوريا", "روسيا", "فرنسا", "ألمانيا", "إيطاليا", "إسبانيا", "البرتغال", "البرازيل", "الأرجنتين", "كندا",
  "أستراليا", "إندونيسيا", "باكستان", "اليونان", "بولندا", "هولندا", "السويد", "النرويج", "سويسرا",
  "العراق", "اليمن"
]

var animals = [
  "قطة", "كلب", "أسد", "نمر", "فيل", "زرافة", "عصفور", "سمكة", "بقرة", "خروف", "ماعز", "دب", "ثعلب", "ذئب",
  "نسر", "حمامة", "ديك", "حصان", "حمار", "جمل", "تمساح", "سلحفاة", "أرنب", "ببغاء", "نملة", "نحلة", "دولفين",
  "قرش", "عقرب", "أفعى", "بطريق", "بومة", "غزال", "قرد", "غراب", "بطة", "فأر", "ظبي", "كوالا", "باندا"
]

var transports = [
  "قارب", "قطار", "سفينة", "شاحنة", "طيارة", "بسكليتة", "دراجة", "سيارة", "تاكسي", "باص", "مترو",
  "موتوسيكل", "سكوتر", "مركب", "عربة", "صاروخ", "منطاد", "زورق", "توك", "ترام"
]



func _ready() -> void:
	setup_topics()
	$Button/Layer1/bra.visibility_layer=false
	$"Button/Layer1/159078".visibility_layer=true
	$Button/Layer1/theword.visibility_layer=false
	$Button/Layer1/theword.text=(topics.get(randi()% topics.size()))
	players.resize(new_project.pNum)
	for index in players.size():
		players.set(index,index+1)
	spy=randi()% players.size()+1
func _physics_process(delta: float) -> void:
	$Player.text = ("اللاعب #" + str(player))

# ====> أضف من هنا <====
func setup_topics():
	# امسح الarray القديمة
	topics.clear()
	
	# أضف المواضيع المختارة حسب الـ booleans
	if new_project.blad:  # دول
		topics.append_array(countries)  # غير لـ countries إذا عندك array تانيه
	if new_project.jmad:  # جماد
		topics.append_array(objects)
	if new_project.rya9h:  # رياضة
		topics.append_array(sports)
	if new_project.hywan:  # حيوانات
		topics.append_array(animals)
	if new_project.amakn:  # أماكن
		topics.append_array(places)
	if new_project.tn8l:  # تنقل
		topics.append_array(transports)  # أو غير لـ transportation إذا عندك array تانيه
	if topics.size() == 0:
		topics=["لم تختر موضوع"]
# ====> إلى هنا <====

func _on_button_pressed() -> void:
	$ClickSound2.play()
	$Button/Layer1/AnimationPlayer.play("Spin")
	await $Button/Layer1/AnimationPlayer.animation_finished
	if tries%2==0||tries==0:
		$"Button/Layer1/159078".visibility_layer=false
		$Button/Layer1/bra.visibility_layer=false
		$Button/Layer1/theword.visibility_layer=true
		$Inst.text = ("هون دورك ببين كان انت برا الموضوع\n او الكلمة الي ما بيعرفها\n الي برا الموضوع ولازم تكشفه\n وما تبينله الكلمة")
	if (tries/2)+1 == spy:
		$Button/Layer1/bra.visibility_layer=true
		$"Button/Layer1/159078".visibility_layer=false
		$Inst.text = ("انت الي برا الموضوعع !!!!\n تصرف بشكل طبيعي ولا تحاول تبين\n انك مو فاهم الكلمة\n حاول اعرفها من كلامهم")
	if tries%2!=0&&tries!=0:
		$"Button/Layer1/159078".visibility_layer=true
		$Button/Layer1/bra.visibility_layer=false
		$Button/Layer1/theword.visibility_layer=false
		$Inst.text = ("اضغط لرؤية الكلمة
 التي لا يعرفها
-برا الموضوع-")

	tries=tries+1
	if tries/2 < new_project.pNum:
		$Button/Layer1/AnimationPlayer.play_backwards("Spin")
		player = ((tries)/2)+1
	else :
		get_tree().change_scene_to_file("res://Timer.tscn")
		
