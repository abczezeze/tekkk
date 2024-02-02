extends Area2D

var speed_olay=100
var direction_olay=Vector2()
var width_olay
var height_olay
var hit_olay = false
var lose_olay = false

func _ready():
	position = get_viewport_rect().size/2
	direction_olay.x = rand_range(-1,1)
	direction_olay.y = rand_range(-1,1)
	direction_olay = direction_olay.normalized()
	width_olay = get_viewport_rect().size.x
	height_olay = get_viewport_rect().size.y
	$Tween.interpolate_property($Sprite_olay,"modulate",Color.blue,Color.white,1,Tween.TRANS_EXPO,Tween.EASE_OUT)
	$Tween.start()

func _process(delta):
	position += direction_olay * speed_olay * delta
	if position.x < 0:
		direction_olay.x =- direction_olay.x
	if position.x > width_olay:
		direction_olay.x = -direction_olay.x
	if position.y < 0:
		direction_olay.y = -direction_olay.y
	if position.y > height_olay:
		direction_olay.y = -direction_olay.y
	
	

func _on_Tek_abc3dz_input_event( viewport, event, shape_idx ):
	if lose_olay:
		return
	if event is InputEventScreenTouch :
		direction_olay.x = rand_range(-1,1)
		direction_olay.y = rand_range(-1,1)
		direction_olay = direction_olay.normalized()
		position.x = rand_range(1,width_olay-1)
		position.y = rand_range(1,height_olay-1)
		speed_olay += 15
		hit_olay = true
		Global.DrumP()
		Global.save_dict["olay_anim"]=true
