extends Area
var dir_y:float = 0.1
var move_speed:float = 1
var clicked:bool = false
onready var anim:AnimationPlayer = $AnimationPlayer

func _ready():
	anim.play("idle")
	dir_y = rand_range(-1,1)
	transform.origin = Vector3(rand_range(-1,1),rand_range(-3,3),0)
	
func _process(delta):
	translate(Vector3(0,dir_y*move_speed*delta,0))
	if transform.origin.y>3:
		dir_y = rand_range(-1,0)
		transform.origin = Vector3(rand_range(-1,1),rand_range(-3,3),0)
	elif transform.origin.y<-3:
		dir_y = rand_range(0,1)
		transform.origin = Vector3(rand_range(-1,1),rand_range(-3,3),0)


func _on_player_olay_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked:
			anim.play("head_rotation")
			move_speed+=0.3
			clicked = true
			Global.save_dict["olay_scores"]+=1
			Global.save_game()
			$OlayCap/CPUParticles.emitting = true
			transform.origin = Vector3(rand_range(-1,1),rand_range(-3,3),0)


func _on_AnimationPlayer_animation_finished(anim_name):
	$OlayCap/CPUParticles.emitting = false
#	queue_free()
	clicked = false
	anim.play("idle")
