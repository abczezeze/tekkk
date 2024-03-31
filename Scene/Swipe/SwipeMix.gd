extends Node2D
var total_scores = 0

var musical_pos_y_arr = [80,1800]
var musical_pos_y = []
var musicalGuitar_pos_y = []
var musicalDrum_pos_y = []
var musicalTurntable_pos_y = []

var movecheck = true #เพื่อไรฟะ
var movecheckGuitar = true
var movecheckDrum = true
var movecheckTurntable = true
var movelr = rand_range(0,1900)
var movelrGuitar = rand_range(0,1900)
var movelrDrum = rand_range(0,1900)
var movelrTurntable = rand_range(0,1900)

var movespeedhead = 4
var movespeedmusical = 200
var movedown = 1
var moveup = -1

var not_swipe = true
var is_swipe_down = false
var is_swipe_up = false
var not_swipeOlay = true
var is_swipe_downOlay = false
var is_swipe_upOlay = false
var not_swipeSpeng = true
var is_swipe_downSpeng = false
var is_swipe_upSpeng = false
var not_swipeIchuen = true
var is_swipe_downIchuen = false
var is_swipe_upIchuen = false

export (Array, Texture) var sprite_textures = []

func _ready():
	musical_pos_y = musical_pos_y_arr[rand_range(0,2)]
	musicalGuitar_pos_y = musical_pos_y_arr[rand_range(0,2)]
	musicalDrum_pos_y = musical_pos_y_arr[rand_range(0,2)]
	musicalTurntable_pos_y = musical_pos_y_arr[rand_range(0,2)]
	Global.MenuAudioS()
	Global.SwipePlay()
	$swipeScene.texture = sprite_textures[rand_range(1.0,4.0)]
	$swipeScene/AnimationPlayer.play("scaleMusical")
	$bg.modulate = Color(rand_range(0.0,1.0),rand_range(0.0,1.0),rand_range(0.0,1.0))

func  _physics_process(delta):
	PathFollowMno(delta)
	PathFollowOlay(delta)
	PathFollowSpeng(delta)
	PathFollowIchuen(delta)
	
	movemusicalBass(delta)
	movemusicalGuitar(delta)
	movemusicalDrum(delta)
	movemusicalTurntable(delta)
	
	total_scores = Global.save_dict["mno_scores"]+Global.save_dict["olay_scores"]+Global.save_dict["ichuen_scores"]+Global.save_dict["speng_scores"]
	tekkk_language(Global.tekkk_language)

func PathFollowMno(delta):
	if is_swipe_down:
		movedown += movespeedhead*delta
		$PathFollow2D/Area2DHead.translate(Vector2(0,movedown))
		not_swipe=false
	if is_swipe_up:
		moveup -= movespeedhead*delta
		$PathFollow2D/Area2DHead.translate(Vector2(0,moveup))
		not_swipe=false

	if not_swipe:
		$PathFollow2D.offset = $PathFollow2D.offset + 150 * delta
	
	if $PathFollow2D/Area2DHead.position.y > get_viewport_rect().size.y:
		not_swipe=true
		is_swipe_down=false
		$PathFollow2D/Area2DHead.position = Vector2()
	if $PathFollow2D/Area2DHead.position.y < -get_viewport_rect().size.y:
		not_swipe=true
		is_swipe_up=false
		$PathFollow2D/Area2DHead.position = Vector2()

func PathFollowOlay(delta):
	if is_swipe_downOlay:
		movedown += movespeedhead*delta
		$PathFollow2DOlay/Area2DHeadOlay.translate(Vector2(0,movedown))
		not_swipeOlay=false
	if is_swipe_upOlay:
		moveup -= movespeedhead*delta
		$PathFollow2DOlay/Area2DHeadOlay.translate(Vector2(0,moveup))
		not_swipeOlay=false

	if not_swipeOlay:
		$PathFollow2DOlay.offset = $PathFollow2DOlay.offset + 150 * -delta
	
	if $PathFollow2DOlay/Area2DHeadOlay.position.y > get_viewport_rect().size.y:
		not_swipeOlay=true
		is_swipe_downOlay=false
		$PathFollow2DOlay/Area2DHeadOlay.position = Vector2()
	if $PathFollow2DOlay/Area2DHeadOlay.position.y < -get_viewport_rect().size.y:
		not_swipeOlay=true
		is_swipe_upOlay=false
		$PathFollow2DOlay/Area2DHeadOlay.position = Vector2()

func PathFollowSpeng(delta):
	if is_swipe_downSpeng:
		movedown += movespeedhead*delta
		$PathFollow2DSpeng/Area2DHeadSpeng.translate(Vector2(0,movedown))
		not_swipeSpeng=false
	if is_swipe_upSpeng:
		moveup -= movespeedhead*delta
		$PathFollow2DSpeng/Area2DHeadSpeng.translate(Vector2(0,moveup))
		not_swipeSpeng=false

	if not_swipeSpeng:
		$PathFollow2DSpeng.offset = $PathFollow2DSpeng.offset + 150 * delta
	
	if $PathFollow2DSpeng/Area2DHeadSpeng.position.y > get_viewport_rect().size.y:
		not_swipeSpeng=true
		is_swipe_downSpeng=false
		$PathFollow2DSpeng/Area2DHeadSpeng.position = Vector2()
	if $PathFollow2DSpeng/Area2DHeadSpeng.position.y < -get_viewport_rect().size.y:
		not_swipeSpeng=true
		is_swipe_upSpeng=false
		$PathFollow2DSpeng/Area2DHeadSpeng.position = Vector2()
		
func PathFollowIchuen(delta):
	if is_swipe_downIchuen:
		movedown += movespeedhead*delta
		$PathFollow2DIchuen/Area2DHeadIchuen.translate(Vector2(0,movedown))
		not_swipeIchuen=false
	if is_swipe_upIchuen:
		moveup -= movespeedhead*delta
		$PathFollow2DIchuen/Area2DHeadIchuen.translate(Vector2(0,moveup))
		not_swipeIchuen=false

	if not_swipeIchuen:
		$PathFollow2DIchuen.offset = $PathFollow2DIchuen.offset + 150 * -delta
	
	if $PathFollow2DIchuen/Area2DHeadIchuen.position.y > get_viewport_rect().size.y:
		not_swipeIchuen=true
		is_swipe_downIchuen=false
		$PathFollow2DIchuen/Area2DHeadIchuen.position = Vector2()
	if $PathFollow2DIchuen/Area2DHeadIchuen.position.y < -get_viewport_rect().size.y:
		not_swipeIchuen=true
		is_swipe_upIchuen=false
		$PathFollow2DIchuen/Area2DHeadIchuen.position = Vector2()
		
func movemusicalBass(delta):
	if $Area2DMusicalBass.position.x > 0 and movecheck:
		movelr += movespeedmusical*delta
		$Area2DMusicalBass.position = Vector2(movelr,musical_pos_y)
		if $Area2DMusicalBass.position.x >= 1080:
			musical_pos_y = musical_pos_y_arr[rand_range(0,2)]
			movecheck = false
	else:
		movelr -= movespeedmusical*delta
		$Area2DMusicalBass.position = Vector2(movelr,musical_pos_y)
		if $Area2DMusicalBass.position.x <= 0:
			$Area2DMusicalBass.position.x = 5
			musical_pos_y = musical_pos_y_arr[rand_range(0,2)]
			movecheck = true

func movemusicalGuitar(delta):
	if $Area2DMusicalGuitar.position.x > 0 and movecheckGuitar:
		movelrGuitar += movespeedmusical*delta
		$Area2DMusicalGuitar.position = Vector2(movelrGuitar,musicalGuitar_pos_y)
		if $Area2DMusicalGuitar.position.x >= 1080:
			musicalGuitar_pos_y = musical_pos_y_arr[rand_range(0,2)]
			movecheckGuitar = false
	else:
		movelrGuitar -= movespeedmusical*delta
		$Area2DMusicalGuitar.position = Vector2(movelrGuitar,musicalGuitar_pos_y)
		if $Area2DMusicalGuitar.position.x <= 0:
			$Area2DMusicalGuitar.position.x = 5
			musicalGuitar_pos_y = musical_pos_y_arr[rand_range(0,2)]
			movecheckGuitar = true
			
func movemusicalDrum(delta):
	if $Area2DMusicalDrum.position.x > 0 and movecheckDrum:
		movelrDrum += movespeedmusical*delta
		$Area2DMusicalDrum.position = Vector2(movelrDrum,musicalDrum_pos_y)
		if $Area2DMusicalDrum.position.x >= 1080:
			musicalDrum_pos_y = musical_pos_y_arr[rand_range(0,2)]
			movecheckDrum = false
	else:
		movelrDrum -= movespeedmusical*delta
		$Area2DMusicalDrum.position = Vector2(movelrDrum,musicalDrum_pos_y)
		if $Area2DMusicalDrum.position.x <= 0:
			$Area2DMusicalDrum.position.x = 5
			musicalDrum_pos_y = musical_pos_y_arr[rand_range(0,2)]
			movecheckDrum = true
			
func movemusicalTurntable(delta):
	if $Area2DMusicalTurntable.position.x > 0 and movecheckTurntable:
		movelrTurntable += movespeedmusical*delta
		$Area2DMusicalTurntable.position = Vector2(movelrTurntable,musicalTurntable_pos_y)
		if $Area2DMusicalTurntable.position.x >= 1080:
			musicalTurntable_pos_y = musical_pos_y_arr[rand_range(0,2)]
			movecheckTurntable = false
	else:
		movelrTurntable -= movespeedmusical*delta
		$Area2DMusicalTurntable.position = Vector2(movelrTurntable,musicalTurntable_pos_y)
		if $Area2DMusicalTurntable.position.x <= 0:
			$Area2DMusicalTurntable.position.x = 5
			musicalTurntable_pos_y = musical_pos_y_arr[rand_range(0,2)]
			movecheckTurntable = true

func _on_Area2DMusicalBass_area_entered(area):
	if area.is_in_group("Mno"):
		Global.save_dict["mno_scores"]+=2
		Global.BassP()
		Global.save_game()
		$PathFollow2D/Tween.interpolate_property($PathFollow2D/Area2DHead/tekgameHead_mno,"scale",Vector2(2,2),Vector2(1,1),5,Tween.TRANS_EXPO,Tween.EASE_OUT)
		$PathFollow2D/Tween.start()
	if area.is_in_group("Olay") or area.is_in_group("Ichuen") or area.is_in_group("Speng"):
		Global.FailedAudioPlay()

func _on_Area2DMusicalGuitar_area_entered(area):
	if area.is_in_group("Speng"):
		Global.save_dict["speng_scores"]+=2
		Global.GuitarP()
		Global.save_game()
		$PathFollow2DSpeng/Tween.interpolate_property($PathFollow2DSpeng/Area2DHeadSpeng/tekgameHeadSpeng,"scale",Vector2(2,2),Vector2(1,1),5,Tween.TRANS_EXPO,Tween.EASE_OUT)
		$PathFollow2DSpeng/Tween.start()
	if area.is_in_group("Olay") or area.is_in_group("Mno") or area.is_in_group("Ichuen"):
		Global.FailedAudioPlay()

func _on_Area2DMusicalDrum_area_entered(area):
	if area.is_in_group("Olay"):
		Global.save_dict["olay_scores"]+=2
		Global.DrumP()
		Global.save_game()
		$PathFollow2DOlay/Tween.interpolate_property($PathFollow2DOlay/Area2DHeadOlay/tekgameHeadOlay,"scale",Vector2(2,2),Vector2(1,1),5,Tween.TRANS_EXPO,Tween.EASE_OUT)
		$PathFollow2DOlay/Tween.start()
	if area.is_in_group("Ichuen") or area.is_in_group("Mno") or area.is_in_group("Speng"):
		Global.FailedAudioPlay()

func _on_Area2DMusicalTurntable_area_entered(area):
	if area.is_in_group("Ichuen"):
		Global.save_dict["ichuen_scores"]+=2
		Global.TurntableP()
		Global.save_game()
		$PathFollow2DIchuen/Tween.interpolate_property($PathFollow2DIchuen/Area2DHeadIchuen/tekgameHeadIchuen,"scale",Vector2(2,2),Vector2(1,1),5,Tween.TRANS_EXPO,Tween.EASE_OUT)
		$PathFollow2DIchuen/Tween.start()
	if area.is_in_group("Olay") or area.is_in_group("Mno") or area.is_in_group("Speng"):
		Global.FailedAudioPlay()

func _on_HomeBT_pressed():
	Global.HomeAudioPlay()
	Global.SwipeStop()
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")

func _on_Area2DHead_input_event(_viewport, event, _shape_idx):
	if not event is InputEventScreenDrag:
		return

	if event is InputEventScreenDrag: 
		if event.relative.x >= -8 and event.relative.x <= 8:
			if event.relative.y >= 8:
				is_swipe_down = true
		if event.relative.x >= -8 and event.relative.x <= 8:
			if event.relative.y <= -8:
				is_swipe_up = true

func _on_Area2DHeadOlay_input_event(_viewport, event, _shape_idx):
	if not event is InputEventScreenDrag:
		return

	if event is InputEventScreenDrag: 
		if event.relative.x >= -8 and event.relative.x <= 8:
			if event.relative.y >= 8:
				is_swipe_downOlay = true
		if event.relative.x >= -8 and event.relative.x <= 8:
			if event.relative.y <= -8:
				is_swipe_upOlay = true

func _on_Area2DHeadSpeng_input_event(_viewport, event, _shape_idx):
	if not event is InputEventScreenDrag:
		return

	if event is InputEventScreenDrag: 
		if event.relative.x >= -8 and event.relative.x <= 8:
			if event.relative.y >= 8:
				is_swipe_downSpeng = true
		if event.relative.x >= -8 and event.relative.x <= 8:
			if event.relative.y <= -8:
				is_swipe_upSpeng = true

func _on_Area2DHeadIchuen_input_event(_viewport, event, _shape_idx):
	if not event is InputEventScreenDrag:
		return

	if event is InputEventScreenDrag: 
		if event.relative.x >= -8 and event.relative.x <= 8:
			if event.relative.y >= 8:
				is_swipe_downIchuen = true
		if event.relative.x >= -8 and event.relative.x <= 8:
			if event.relative.y <= -8:
				is_swipe_upIchuen = true

func tekkk_language(language):
	if language == "En":
		$VBoxContainer/ClickMno.text="Mno : "+str(Global.save_dict["mno_scores"])
		$VBoxContainer/ClickOlay.text="Olay : "+str(Global.save_dict["olay_scores"])
		$VBoxContainer/ClickIchuen.text="Ichuen : "+str(Global.save_dict["ichuen_scores"])
		$VBoxContainer/ClickSpeng.text="Speng : "+str(Global.save_dict["speng_scores"])
		$TotalScores.text = "Total : "+ str(total_scores)
	if language == "Th":
		$VBoxContainer/ClickMno.text="คุณมโน : "+str(Global.save_dict["mno_scores"])
		$VBoxContainer/ClickOlay.text="คุณโอเล : "+str(Global.save_dict["olay_scores"])
		$VBoxContainer/ClickIchuen.text="คุณไอชื่น : "+str(Global.save_dict["ichuen_scores"])
		$VBoxContainer/ClickSpeng.text="คุณสเปง : "+str(Global.save_dict["speng_scores"])
		$TotalScores.text = "คะแนนรวม : "+ str(total_scores)
