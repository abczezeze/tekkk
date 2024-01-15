extends Node2D

func _ready():
	Global.FloatingPlay()
	$Click_.text = str(Global.speng_scores)
	$AnimatedSprite.speed_scale=0
	for n in 14:
		var speng_add = $speng_right.duplicate()
		add_child(speng_add)
#		print_debug(spengred)
	$AnimatedSprite.speed_scale = 0
	
func _process(delta):
	#when click right
	if $speng_right.hit_speng == true :
		press_right()

	$speng_right.hit_speng = false 

	
func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")

func press_right():
	Global.speng_scores += 1
	$Click_.text = str(Global.speng_scores)
	$AnimatedSprite.speed_scale += 1
	if $AnimatedSprite.speed_scale>=10:
		_on_HomeBT_pressed()

func _on_Timer_timeout():
	$Label.visible = false
