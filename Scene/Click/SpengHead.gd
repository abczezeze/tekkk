extends Area2D

var width_speng
var height_speng
var scales=0
var hit_speng = false
var lose_speng = false
onready var tween_node = $Sprite_speng/Tween
onready var sprity = $Sprite_spengpeng

func _ready():
	position = get_viewport_rect().size/2
	width_speng = get_viewport_rect().size.x
	height_speng = get_viewport_rect().size.y

func _on_Tek_abc3dz_input_event( viewport, event, shape_idx ):
	if event is InputEventScreenTouch :
		position.x = rand_range(1,width_speng-1)
		position.y = rand_range(1,height_speng-1)
		hit_speng=true
		Global.GuitarP()

func _on_Timer_timeout():
	position.x = rand_range(1,width_speng-1)
	position.y = rand_range(1,height_speng-1)
	$Tween.interpolate_property($SpengSprite,"modulate",Color.black,Color.white,5,Tween.TRANS_EXPO,Tween.EASE_OUT)
	$Tween.start()
