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
	#when click wrong
#	if $speng_wrong.hit_speng == true :
#		press_wrong()

	#when click wrong, back to main scene
#	if Global.wrong_scores>2:
#		Global.FloatingStop()
#		Global.wrong_scores = 0
#		get_tree().change_scene("res://Scene/MainMenu.tscn")

	$speng_right.hit_speng = false 
#	$speng_wrong.hit_speng = false 

	
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
#	Global.GuitarP()
#	$Bg.modulate = Color.white
#	$speng_right.modulate = Color.white

#func press_wrong():
#	Global.wrong_scores += 1
#	$AnimatedSprite.speed_scale -= 1
#	Global.GuitarPitch()
#	$Bg.modulate = Color.black
#	$speng_right.modulate = Color.black
