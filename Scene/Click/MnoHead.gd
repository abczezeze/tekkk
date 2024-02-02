extends Area2D

var speed_mno=100
var direction_mno=Vector2()
var width_mno
var hit_mno = false

func _ready():
	position.y = rand_range(20,1900)
	direction_mno.x = rand_range(0,1)
	direction_mno = direction_mno.normalized()
	width_mno = get_viewport_rect().size.x
	$Tween.interpolate_property($Sprite_mno,"modulate",Color.coral,Color.white,1,Tween.TRANS_EXPO,Tween.EASE_OUT)
	$Tween.start()

func _process(delta):
	position += direction_mno * speed_mno * delta
	if position.x > width_mno:
		position.x=0
		position.y = rand_range(10,1900)

func _on_Tek_abc3dz_input_event( viewport, event, shape_idx ):
	if event is InputEventScreenTouch :
		position.x = 0
		position.y = rand_range(20,1900)
		direction_mno.x = rand_range(0,1)
		direction_mno = direction_mno.normalized()
		speed_mno += 15
		hit_mno = true
		Global.BassP()
		Global.save_dict["mno_anim"]=true
