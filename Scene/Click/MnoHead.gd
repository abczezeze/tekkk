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
		$Timer.start()
		$Sprite2_mno.visible = true
		Global.BassP()

func _on_Timer_timeout():
	$Sprite2_mno.visible = false
