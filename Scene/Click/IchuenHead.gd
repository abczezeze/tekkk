extends Area2D

var speed_ichuen=100
var direction_ichuen=Vector2()
var width_ichuen
var hit_ichuen = false

func _ready():
	position.y = rand_range(20,1900)
	direction_ichuen.x = rand_range(-1,0)
	direction_ichuen = direction_ichuen.normalized()
	width_ichuen = get_viewport_rect().size.x
	$Tween.interpolate_property($Sprite_ichuen,"modulate",Color.indigo,Color.white,1,Tween.TRANS_EXPO,Tween.EASE_OUT)
	$Tween.start()

func _process(delta):
	position += direction_ichuen * speed_ichuen * delta
	if position.x < 0:
		position.x=1060
		position.y = rand_range(10,1900)

func _on_Tek_abc3dz_input_event( viewport, event, shape_idx ):
	if event is InputEventScreenTouch :
		position.x = 1060
		position.y = rand_range(20,1900)
		direction_ichuen.x = rand_range(-1,0)
		direction_ichuen = direction_ichuen.normalized()
		speed_ichuen += 15
		hit_ichuen = true
		Global.TurntableP()
		Global.ichuen_animte_sprite=true
