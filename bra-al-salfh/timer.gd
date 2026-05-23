extends Control
var firstTime=true
func _ready() -> void:
	$Timer.wait_time=new_project.mNum*60
	$Timer.start()
	$Timer/Label.text = str(new_project.mNum)+(":00")

func _physics_process(delta: float) -> void:
	$Timer/Label.text = str(int($Timer.time_left/60))+(":")+str(int(int($Timer.time_left)%60))
