extends Node2D

onready var PlayIntegration = get_node("/root/PlayIntegration")

var time_start = 0
var time_now = 0
var total_scores = 0
var mno_scores = 0
var olay_scores = 0
var speng_scores = 0
var ichuen_scores = 0

func _ready():
	PlayIntegration.sign_in()
	time_start = OS.get_unix_time()
	set_process(true)
	
func _process(delta):
	time_now = OS.get_unix_time()
	var elasped = time_now - time_start
	var mins = elasped/60
	var secs = elasped%60
	var str_elapsed = "%02d : %02d" % [mins,secs]
	
	if $Tek_abc3dz_mno.hit_mno == true :
		$Tek_abc3dz_mno.clicks_mno += 1
		$VBoxContainer/ClickMno.text = "Mno#Bass : " + str($Tek_abc3dz_mno.clicks_mno)
		mno_scores = $Tek_abc3dz_mno.clicks_mno
		PlayIntegration.achievementsStepsMno(mno_scores*10)
		submit_total_score(total_scores*10)

	if $Tek_abc3dz_olay.hit_olay == true :
		$Tek_abc3dz_olay.clicks_olay += 1
		$VBoxContainer/ClickOlay.text = "Olay#Drum : " + str($Tek_abc3dz_olay.clicks_olay)
		olay_scores = $Tek_abc3dz_olay.clicks_olay
		PlayIntegration.achievementsStepsOlay(olay_scores*10)
		submit_total_score(total_scores*10)
		
	if $Tek_abc3dz_ichuen.hit_ichuen == true :
		$Tek_abc3dz_ichuen.clicks_ichuen += 1
		$VBoxContainer/ClickIchuen.text = "Ichuen#Turntable : " + str($Tek_abc3dz_ichuen.clicks_ichuen)
		ichuen_scores = $Tek_abc3dz_ichuen.clicks_ichuen
		PlayIntegration.achievementsStepsIchuen(ichuen_scores*10)
		submit_total_score(total_scores*10)
		
	if $Tek_abc3dz_speng.hit_speng == true :
		$Tek_abc3dz_speng.clicks_speng += 1
		$VBoxContainer/ClickSpeng.text = "Speng#Guitar : " + str($Tek_abc3dz_speng.clicks_speng)
		speng_scores = $Tek_abc3dz_speng.clicks_speng
		PlayIntegration.achievementsStepsSpeng(speng_scores*10)
		submit_total_score(total_scores*10)
				
	$Tek_abc3dz_olay.hit_olay = false 
	$Tek_abc3dz_mno.hit_mno = false 
	$Tek_abc3dz_ichuen.hit_ichuen = false 
	$Tek_abc3dz_speng.hit_speng = false 
	total_scores = $Tek_abc3dz_speng.clicks_speng + $Tek_abc3dz_olay.clicks_olay + $Tek_abc3dz_ichuen.clicks_ichuen + $Tek_abc3dz_mno.clicks_mno
	$VBoxContainer/ClickT.text = "Total : "+ str(total_scores)
	$DTLabel.text = "Time : "+ str(str_elapsed)

func submit_total_score(score : int):
	PlayIntegration.unlock_achievements(score)
	PlayIntegration.achievementsSteps(score)
