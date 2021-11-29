extends Area2D

var speed_ichuen=100
var direction_ichuen=Vector2()
var width_ichuen
var height_ichuen
var hit_ichuen = false
var lose_ichuen = false
var clicks_ichuen = 0

func _ready():
	$Sprite2_ichuen.hide()
	position = get_viewport_rect().size/2
	direction_ichuen.x = rand_range(-1,1)
	direction_ichuen.y = rand_range(-1,1)
	direction_ichuen = direction_ichuen.normalized()
	width_ichuen = get_viewport_rect().size.x
	height_ichuen = get_viewport_rect().size.y

func _process(delta):
	position += direction_ichuen * speed_ichuen * delta
	if position.x < 0:
		direction_ichuen.x =- direction_ichuen.x
	if position.x > width_ichuen:
		direction_ichuen.x = -direction_ichuen.x
	if position.y < 0:
		direction_ichuen.y = -direction_ichuen.y
	if position.y > height_ichuen:
		direction_ichuen.y = -direction_ichuen.y

func _on_Tek_abc3dz_input_event( viewport, event, shape_idx ):
	if lose_ichuen:
		return
	if event is InputEventScreenTouch :
		direction_ichuen.x = rand_range(-1,1)
		direction_ichuen.y = rand_range(-1,1)
		direction_ichuen = direction_ichuen.normalized()
		position.x = rand_range(1,width_ichuen-1)
		position.y = rand_range(1,height_ichuen-1)
		speed_ichuen += 15
		hit_ichuen = true
		$Sprite2_ichuen.show()
		$HitSound_ichuen.play()
		
func _on_HitSound_ichuen_finished():
	$Sprite2_ichuen.hide()
