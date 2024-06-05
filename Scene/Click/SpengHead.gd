extends Area2D

var width_speng
var height_speng
var scales=0
var hit_speng = false
var lose_speng = false

func _ready():
	position = get_viewport_rect().size/2
	width_speng = get_viewport_rect().size.x
	height_speng = get_viewport_rect().size.y
	$Tween.interpolate_property($SpengSprite,"modulate",Color.yellow,Color.white,1,Tween.TRANS_EXPO,Tween.EASE_OUT)
	$Tween.start()
	
func _process(delta):
	$Label.text = str(Global.save_dict["speng_scores"])

func _on_Tek_abc3dz_input_event(_viewport, event,_shape_idx ):
	if event is InputEventScreenTouch :
		position.x = rand_range(1,width_speng-1)
		position.y = rand_range(1,height_speng-1)
		hit_speng=true
		Global.GuitarP()
		Global.save_dict["speng_anim"]=true

func _on_Timer_timeout():
	position.x = rand_range(1,width_speng-1)
	position.y = rand_range(1,height_speng-1)
	
	
