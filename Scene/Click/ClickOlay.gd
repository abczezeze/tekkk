extends Node2D
var right_press=0
func _ready():
	Global.FloatingPlay()
	$Click_.text = str(Global.olay_scores)
	$AnimatedSprite.speed_scale=0
	$AnimatedSprite.visible=false
	for n in 2:
		var olay_add = $olay_right.duplicate()
		add_child(olay_add)
	if Global.tekkk_language=="Th":
		$Label.text="คลิกที่หัวการ์ตูน\nมีเพืยงหนึ่งเดียว"
	
func _process(delta):
	if Global.olay_scores>=1 and Global.olay_scores<=3:
		$Label.visible=false
		$AnimatedSprite.visible=true
	if Global.olay_scores>=4:
		$Label.visible=false
		$AnimatedSprite.visible=true
		$AnimatedSprite.speed_scale=1
		$AnimatedSprite.modulate=Color.white
	if $olay_right.hit_olay == true :
		press_right()
	$olay_right.hit_olay = false 

func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")
	
func press_right():
	Global.olay_scores += 1
	$Click_.text = str(Global.olay_scores)
	$AnimatedSprite.visible=true
	$Label.visible=false
	right_press+=1
	if right_press==2:
		$AnimatedSprite.speed_scale += 1
	if right_press>=3:
		$AnimatedSprite.speed_scale += 1
		$AnimatedSprite.modulate = Color.white
	for n in 2:
		var olay_add = $olay_right.duplicate()
		add_child(olay_add)
