extends Node

var total_scores = 0
var mno_scores = 0
var olay_scores = 0
var speng_scores = 0
var ichuen_scores = 0
	
func HomeAudioPlay():
	$HomeAudio.play()

func AccurateAudioPlay():
	$Accurate.play()

func FailedAudioPlay():
	$Failed.play()
	
func SceneSoundPlay():
	$SceneSound.play()

func OneToFiveSound():
	$OneToFive.play()
func OneToFiveStop():
	$OneToFive.stop()
	
func SixToNineSound():
	$SixToNine.play()
func SixToNineStop():
	$SixToNine.stop()
	
func submit_total_score(score : int):
	PlayIntegration.unlock_achievements(score)
	PlayIntegration.achievementsSteps(score)
