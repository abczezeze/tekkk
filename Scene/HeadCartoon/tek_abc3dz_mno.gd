extends Area2D

var speed_mno=100
var direction_mno=Vector2()
var width_mno
var height_mno
var hit_mno = false
var lose_mno = false

func _ready():
	$Sprite2_mno.hide()
	position = get_viewport_rect().size/2
	direction_mno.x = rand_range(-1,1)
	direction_mno.y = rand_range(-1,1)
	direction_mno = direction_mno.normalized()
	width_mno = get_viewport_rect().size.x
	height_mno = get_viewport_rect().size.y

func _process(delta):
	position += direction_mno * speed_mno * delta
	if position.x < 0:
		direction_mno.x = -direction_mno.x
	if position.x > width_mno:
		direction_mno.x = -direction_mno.x
	if position.y < 0:
		direction_mno.y = -direction_mno.y
	if position.y > height_mno:
		direction_mno.y = -direction_mno.y

func _on_Tek_abc3dz_input_event( viewport, event, shape_idx ):
	if lose_mno:
		return
	if event is InputEventScreenTouch :
		direction_mno.x = rand_range(-1,1)
		direction_mno.y = rand_range(-1,1)
		direction_mno = direction_mno.normalized()
		position.x = rand_range(1,width_mno-1)
		position.y = rand_range(1,height_mno-1)
		speed_mno += 15
		hit_mno = true
		$Sprite2_mno.show()
		$HitSound_mno.play()

func _on_HitSound_mno_finished():
	$Sprite2_mno.hide()
