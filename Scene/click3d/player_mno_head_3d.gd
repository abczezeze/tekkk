extends Area
var dir_x:float = 0.1
var move_speed:float = 1
var clicked:bool = false
onready var anim:AnimationPlayer = $AnimationPlayer
export (Array,AudioStreamOGGVorbis) var sound_efx = []

func _ready():
	anim.play("idle")
	dir_x = rand_range(-2,2)
	$Label3D.text = str(Global.save_dict["mno_scores"])
	transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-6)
	
func _process(delta):
	transform.origin.x += dir_x*move_speed*delta
	if transform.origin.x>2:
		dir_x = rand_range(-2,0)
		transform.origin = Vector3(1,rand_range(-3,3),-6)
	elif transform.origin.x<-2:
		dir_x = rand_range(0,2)
		transform.origin = Vector3(-1,rand_range(-3,3),-6)
		
func _on_AnimationPlayer_animation_finished(_anim_name):
	$mnoTrouser/CPUParticles.emitting = false
	clicked = false
	anim.play("idle")

func _on_player_mno_head_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked and Global.position_z_click3d == -1:
			anim.play("head_rotation")
			move_speed+=0.3
			clicked = true
			Global.save_dict["mno_scores"]+=1
			Global.save_game()
			$mnoTrouser/CPUParticles.emitting = true
			transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-6)
			$Label3D.text = str(Global.save_dict["mno_scores"])
			$AudioStreamPlayer.stream = sound_efx[rand_range(0,sound_efx.size())]
			$AudioStreamPlayer.stream.loop = false
			$AudioStreamPlayer.play()

