extends Node2D

var total_scores = 0
export (Array, Texture) var sprite_textures = []

func _ready():
	Global.FloatingPlay()
	$clickScene.texture = sprite_textures[rand_range(1.0,4.0)]
	$AnimationPlayer.play("scaleSprite")
	$bg.modulate = Color(rand_range(0.0,1.0),rand_range(0.0,1.0),rand_range(0.0,1.0))
	
	
func _process(_delta):
	if $Tek_abc3dz_mno.hit_mno == true :
		Global.save_dict["mno_scores"]+=1
		Global.save_game()
		$PanelContainer/MnoAnimatedSprite.playing=Global.save_dict["mno_anim"]

	if $Tek_abc3dz_olay.hit_olay == true :
		Global.save_dict["olay_scores"]+=1
		Global.save_game()
		$PanelContainer/OlayAnimatedSprite.playing=Global.save_dict["olay_anim"]
		
	if $Tek_abc3dz_ichuen.hit_ichuen == true :
		Global.save_dict["ichuen_scores"]+=1
		Global.save_game()
		$PanelContainer/IchuenAnimatedSprite.playing=Global.save_dict["ichuen_anim"]
		
	if $Tek_abc3dz_speng.hit_speng == true :
		Global.save_dict["speng_scores"]+=1
		Global.save_game()
		$PanelContainer/SpengAnimatedSprite.playing=Global.save_dict["speng_anim"]

	$Tek_abc3dz_olay.hit_olay = false
	$Tek_abc3dz_mno.hit_mno = false
	$Tek_abc3dz_ichuen.hit_ichuen = false
	$Tek_abc3dz_speng.hit_speng = false
	total_scores = Global.save_dict["mno_scores"]+Global.save_dict["olay_scores"]+Global.save_dict["ichuen_scores"]+Global.save_dict["speng_scores"]
	tekkk_language(Global.tekkk_language)

func _on_HomeBT_pressed():
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
	Global.HomeAudioPlay()
	Global.FloatingStop()

func tekkk_language(language):
	if language == "En":
		$TotalScores.text = "Total : "+ str(total_scores)
	if language == "Th":
		$TotalScores.text = "คะแนนรวม : "+ str(total_scores)
