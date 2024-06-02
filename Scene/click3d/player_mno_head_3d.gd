extends Area
var dir_x:float = 0.1
var move_speed:float = 1
var clicked:bool = false
onready var anim:AnimationPlayer = $AnimationPlayer

func _ready():
	anim.play("idle")
	dir_x = rand_range(-1,1)
	transform.origin = Vector3(0,rand_range(-2,2),-5)
	
func _process(delta):
	translate(Vector3(dir_x*move_speed*delta,0,-5))
	if transform.origin.x>1:
		dir_x = rand_range(-1,0)
	elif transform.origin.x<-1:
		dir_x = rand_range(0,1)

func _on_AnimationPlayer_animation_finished(anim_name):
	$mnoTrouser/CPUParticles.emitting = false
#	queue_free()
	clicked = false

func _on_player_mno_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked and Global.camera_scene_a.transform.origin.z == 3:
			print(Global.camera_scene_a.transform.origin.z)
			anim.play("head_rotation")
			move_speed+=0.3
			clicked = true
			Global.save_dict["mno_scores"]+=1
			Global.save_game()
			$mnoTrouser/CPUParticles.emitting = true
