extends Node2D

func _ready():
	Global.FloatingPlay()
	$ClickMno.text = str(Global.mno_scores)
	$AnimatedSprite.speed_scale=0
	for n in 14:
		var mno_add = $mno_right.duplicate()
		add_child(mno_add)
	if Global.tekkk_language=="Th":
		$Label.text="มีเพืยงหนึ่งเดียว"	
	
func _process(delta):
	if $mno_right.hit_mno == true :
		press_right()
	$mno_right.hit_mno = false 
	
func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")
	
func press_right():
	Global.mno_scores += 1
	$ClickMno.text = str(Global.mno_scores)
	$AnimatedSprite.speed_scale += 1
	if $AnimatedSprite.speed_scale>=10:
		_on_HomeBT_pressed()
	if $AnimatedSprite.speed_scale==9:
		$AnimatedSprite.modulate = Color.black

func _on_Timer_timeout():
	$Label.visible = false
