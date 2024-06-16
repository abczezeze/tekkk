extends Area
var dir_y:float = 0.1
var move_speed:float = 1
var clicked:bool = false
onready var anim:AnimationPlayer = $AnimationPlayer
export (Array,AudioStreamOGGVorbis) var sound_efx = []

func _ready():
	anim.play("idle")
	dir_y = rand_range(-2,2)
	$Label3D.text = str(Global.save_dict["olay_scores"])
	transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-14)
	
func _process(delta):
	transform.origin.y += dir_y*move_speed*delta
	if transform.origin.y>4:
		dir_y = rand_range(-2,0)
		transform.origin = Vector3(rand_range(-2,2),4,-14)
	elif transform.origin.y<-4:
		dir_y = rand_range(0,2)
		transform.origin = Vector3(rand_range(-2,2),-4,-14)

func _on_player_olay_head_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked and Global.position_z_click3d == -8:
			anim.play("head_rotation")
			move_speed+=0.3
			clicked = true
			Global.save_dict["olay_scores"]+=1
			Global.save_game()
			$OlayCap/CPUParticles.emitting = true
			transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-14)
			$Label3D.text = str(Global.save_dict["olay_scores"])
			$AudioStreamPlayer.stream = sound_efx[rand_range(0,sound_efx.size())]
			$AudioStreamPlayer.stream.loop = false
			$AudioStreamPlayer.play()

func _on_AnimationPlayer_animation_finished(_anim_name):
	$OlayCap/CPUParticles.emitting = false
	clicked = false
	anim.play("idle")

