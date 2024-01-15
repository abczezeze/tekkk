extends Node2D

func _ready():
	Global.FloatingPlay()
	$AnimatedSprite.speed_scale=0
	$Click_.text = str(Global.ichuen_scores)
	
	for n in 14:
		var ichuen_add = $ichuen_right.duplicate()
		add_child(ichuen_add)
	
func _process(delta):
	if $ichuen_right.hit_ichuen == true :
		press_right()
	
	$ichuen_right.hit_ichuen = false 
	
func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/Floating/FloatingAlternative.tscn")

func press_right():
	Global.ichuen_scores += 1
	$Click_.text = str(Global.ichuen_scores)
	$AnimatedSprite.speed_scale += 1
	Global.TurntableP()
	if $AnimatedSprite.speed_scale>=10:
		_on_HomeBT_pressed()

