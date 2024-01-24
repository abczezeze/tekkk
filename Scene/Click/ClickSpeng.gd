extends Node2D

var x=0
var y=0
var right_press=0

func _ready():
	Global.FloatingPlay()
	$Click_.text = str(Global.speng_scores)
	$AnimatedSprite.speed_scale=0
	$AnimatedSprite.visible=false
	for n in 2:
		var speng_add = $speng_right.duplicate()
		add_child(speng_add)
		x=rand_range(0,get_viewport_rect().size.x)
		y=rand_range(0,get_viewport_rect().size.y)
		speng_add.position = Vector2(x,y)
	if Global.tekkk_language=="Th":
		$Label.text="คลิกที่หัวการ์ตูน\nมีเพืยงหนึ่งเดียวอะ"
		
func _process(delta):
	if Global.speng_scores>=1 and Global.speng_scores<=3:
		$Label.visible=false
		$AnimatedSprite.visible=true
	if Global.speng_scores>=4:
		$Label.visible=false
		$AnimatedSprite.visible=true
		$AnimatedSprite.speed_scale=1
		$AnimatedSprite.modulate=Color.white
	if $speng_right.hit_speng == true :
		press_right()
	$speng_right.hit_speng = false 
	
func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")

func press_right():
	$speng_right/GuitarSprite/Timer.start()
	for n in 2:
		var speng_add = $speng_right.duplicate()
		add_child(speng_add)
		x=rand_range(0,get_viewport_rect().size.x)
		y=rand_range(0,get_viewport_rect().size.y)
		speng_add.position = Vector2(x,y)
	Global.speng_scores += 1
	$Click_.text = str(Global.speng_scores)
	$AnimatedSprite.visible=true
	$Label.visible=false
	$speng_right/GuitarSprite.visible=true
	right_press+=1
	if right_press==2:
		$AnimatedSprite.speed_scale += 1
	if right_press>=4:
		$AnimatedSprite.speed_scale += 1
		$AnimatedSprite.modulate = Color.white

func _on_Timer_timeout():
	$speng_right/GuitarSprite.visible=false
