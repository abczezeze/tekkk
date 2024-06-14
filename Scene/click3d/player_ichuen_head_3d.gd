extends Area
var dir_x:float = 0.1
var dir_y:float = 0.1
var move_speed:float = 1
var clicked:bool = false
onready var anim:AnimationPlayer = $AnimationPlayer
export (Array,AudioStreamOGGVorbis) var sound_efx = []

func _ready():
	anim.play("idle")
	dir_x = rand_range(-1,1)
	dir_y = rand_range(-1,1)
	$Label3D.text = str(Global.save_dict["ichuen_scores"])
	transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
	
func _process(delta):
	translate(Vector3(dir_x*move_speed*delta,dir_y*move_speed*delta,0))
	if transform.origin.x>2:
		dir_x = rand_range(-1,0)
		transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
	elif transform.origin.x<-2:
		dir_x = rand_range(0,1)
		transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
		
	if transform.origin.y>4:
		dir_y = rand_range(-1,0)
		transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
	elif transform.origin.y<-4:
		dir_y = rand_range(0,1)
		transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
		
func _on_AnimationPlayer_animation_finished(anim_name):
	$ICBd/CPUParticles.emitting = false
	clicked = false
	anim.play("idle")

func _on_player_ichuen_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked:
			anim.play("head_rotation")
			move_speed+=0.3
			clicked = true
			Global.save_dict["ichuen_scores"]+=1
			Global.save_game()
			$ICBd/CPUParticles.emitting = true
			transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
			$Label3D.text = str(Global.save_dict["ichuen_scores"])
			$AudioStreamPlayer.stream = sound_efx[rand_range(0,sound_efx.size())]
			$AudioStreamPlayer.stream.loop = false
			$AudioStreamPlayer.play()
