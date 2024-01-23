extends Node2D

var x=0
var y=0
var right_press=0

func _ready():
	Global.FloatingPlay()
	$Click_.text = str(Global.speng_scores)
	$AnimatedSprite.speed_scale=0
	$AnimatedSprite.visible=false
	for n in 9:
		var speng_add = $speng_right.duplicate()
		add_child(speng_add)
		x=rand_range(0,get_viewport_rect().size.x)
		y=rand_range(0,get_viewport_rect().size.y)
		$speng_right.position = Vector2(x,y)
	if Global.tekkk_language=="Th":
		$Label.text="คลิกที่หัวการ์ตูน\nมีเพืยงหนึ่งเดียวอะ"
		
func _process(delta):
	if $speng_right.hit_speng == true :
		press_right()
	$speng_right.hit_speng = false 
	
func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")

func press_right():
	var rand_dup = rand_range(1,2)
	for n in rand_dup:
		var speng_add = $speng_right.duplicate()
		add_child(speng_add)
		x=rand_range(0,get_viewport_rect().size.x)
		y=rand_range(0,get_viewport_rect().size.y)
		$speng_right.position = Vector2(x,y)
	Global.speng_scores += 1
	$Click_.text = str(Global.speng_scores)
	$AnimatedSprite.visible=true
	$Label.visible=false
	right_press+=1
	if right_press==2:
		$AnimatedSprite.speed_scale += 1
	if right_press>=3:
		$AnimatedSprite.speed_scale += 1
		$AnimatedSprite.modulate = Color.white
