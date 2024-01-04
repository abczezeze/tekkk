extends Node2D
var musical_pos_y_arr = [80,1800]
var musical_pos_y = []

var movecheck = true
var movelr = rand_range(0,1900)

var movespeedhead = 4
var movespeedmusical = 200
var movedown = 1
var moveup = -1

var not_swipe = true
var is_swipe_down = false
var is_swipe_up = false

func _ready():
	musical_pos_y = musical_pos_y_arr[rand_range(0,2)]
	$ClickMno.text = str(Global.mno_scores)
#	if randi() % 2:
#		movecheck = false

func  _physics_process(delta):
	PathFollowMno(delta)	
	movemusicalBass(delta)

	Global.total_scores = Global.speng_scores+Global.ichuen_scores+Global.olay_scores+Global.mno_scores
	$ClickT.text = "Total : "+ str(Global.total_scores)

func PathFollowMno(delta):
	if is_swipe_down:
		movedown += movespeedhead*delta
		$PathFollow2D/Area2DHead.translate(Vector2(0,movedown))
		not_swipe=false
	if is_swipe_up:
		moveup -= movespeedhead*delta
		$PathFollow2D/Area2DHead.translate(Vector2(0,moveup))
		not_swipe=false

	if not_swipe:
		$PathFollow2D.offset = $PathFollow2D.offset + 150 * delta
	
	if $PathFollow2D/Area2DHead.position.y > get_viewport_rect().size.y:
		not_swipe=true
		is_swipe_down=false
		$PathFollow2D/Area2DHead.position = Vector2()
	if $PathFollow2D/Area2DHead.position.y < -get_viewport_rect().size.y:
		not_swipe=true
		is_swipe_up=false
		$PathFollow2D/Area2DHead.position = Vector2()

func movemusicalBass(delta):
	if $Area2DMusicalBass.position.x > 0 and movecheck:
		movelr += movespeedmusical*delta
		$Area2DMusicalBass.position = Vector2(movelr,musical_pos_y)
		if $Area2DMusicalBass.position.x >= 1080:
			musical_pos_y = musical_pos_y_arr[rand_range(0,2)]
			movecheck = false
	else:
		movelr -= movespeedmusical*delta
		$Area2DMusicalBass.position = Vector2(movelr,musical_pos_y)
		if $Area2DMusicalBass.position.x <= 0:
			$Area2DMusicalBass.position.x = 5
			musical_pos_y = musical_pos_y_arr[rand_range(0,2)]
			movecheck = true

func _on_Timer_timeout():
	var r = rand_range(0.0,1.0)
	var g = rand_range(0.0,1.0)
	var b = rand_range(0.0,1.0)
	$bg.modulate = Color(r,g,b)

func _on_Area2DMusicalBass_area_entered(area):
	if area.is_in_group("Mno"):
		Global.mno_scores += 1
		Global.BassP()
		$ClickMno.text = str(Global.mno_scores)

func _on_HomeBT_pressed():
	Global.HomeAudioPlay()
	get_tree().change_scene("res://Scene/MainMenu.tscn")

func _on_Area2DHead_input_event(viewport, event, shape_idx):
	if not event is InputEventScreenDrag:
		return

	if event is InputEventScreenDrag: 
		if event.relative.x >= -8 and event.relative.x <= 8:
			if event.relative.y >= 8:
				is_swipe_down = true
		if event.relative.x >= -8 and event.relative.x <= 8:
			if event.relative.y <= -8:
				is_swipe_up = true
