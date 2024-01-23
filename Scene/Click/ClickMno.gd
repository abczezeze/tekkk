extends Node2D
var right_press=0
func _ready():
	Global.FloatingPlay()
	$ClickMno.text = str(Global.mno_scores)
	$AnimatedSprite.speed_scale=0
	$AnimatedSprite.visible=false
	for n in 2:
		var mno_add = $mno_right.duplicate()
		add_child(mno_add)
	if Global.tekkk_language=="Th":
		$Label.text="คลิกที่หัวการ์ตูน\nมีเพืยงหนึ่งเดียว"
	
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
	$AnimatedSprite.visible=true
	$Label.visible=false
	$Tween.interpolate_property($mno_right,"rotation_degees",-360,360,1,Tween.TRANS_EXPO,Tween.EASE_OUT)
	$Tween.start()
	right_press+=1
	if right_press==2:
		$AnimatedSprite.speed_scale += 1
	if right_press>=3:
		$AnimatedSprite.speed_scale += 1
		$AnimatedSprite.modulate = Color.white
