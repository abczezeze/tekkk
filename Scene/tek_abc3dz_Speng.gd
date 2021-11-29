extends Area2D

var speed_speng=100
var direction_speng=Vector2()
var width_speng
var height_speng
var hit_speng = false
var lose_speng = false
var clicks_speng = 0

func _ready():
	$Sprite2_speng.hide()
	position = get_viewport_rect().size/2
	direction_speng.x = rand_range(-1,1)
	direction_speng.y = rand_range(-1,1)
	direction_speng = direction_speng.normalized()
	width_speng = get_viewport_rect().size.x
	height_speng = get_viewport_rect().size.y

func _process(delta):
	position += direction_speng * speed_speng * delta
	if position.x < 0:
		direction_speng.x =- direction_speng.x
	if position.x > width_speng:
		direction_speng.x = -direction_speng.x
	if position.y < 0:
		direction_speng.y = -direction_speng.y
	if position.y > height_speng:
		direction_speng.y = -direction_speng.y

func _on_Tek_abc3dz_input_event( viewport, event, shape_idx ):
	if lose_speng:
		return
	if event is InputEventScreenTouch :
		direction_speng.x = rand_range(-1,1)
		direction_speng.y = rand_range(-1,1)
		direction_speng = direction_speng.normalized()
		position.x = rand_range(1,width_speng-1)
		position.y = rand_range(1,height_speng-1)
		speed_speng += 15
		hit_speng = true
		$Sprite2_speng.show()
		$HitSound_speng.play()
		
func _on_HitSound_speng_finished():
	$Sprite2_speng.hide()
