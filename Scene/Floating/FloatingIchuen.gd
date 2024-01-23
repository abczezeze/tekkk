extends Node2D
var right_press=0
func _ready():
	Global.FloatingPlay()
	$AnimatedSprite.speed_scale=0
	$AnimatedSprite.visible=false
	$Click_.text = str(Global.ichuen_scores)
	for n in 9:
		var ichuen_add = $ichuen_right.duplicate()
		add_child(ichuen_add)
	if Global.tekkk_language=="Th":
		$Label.text="คลิกที่หัวการ์ตูน\nมีเพืยงหนึ่งเดียว"
		
func _process(delta):
	if $ichuen_right.hit_ichuen == true :
		press_right()
	$ichuen_right.hit_ichuen = false 
	
func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")

func press_right():
	Global.ichuen_scores += 1
	$Click_.text = str(Global.ichuen_scores)
	$AnimatedSprite.visible=true
	$Label.visible=false
	right_press+=1
	if right_press==2:
		$AnimatedSprite.speed_scale += 1
	if right_press>=3:
		$AnimatedSprite.speed_scale += 1
		$AnimatedSprite.modulate = Color.white
