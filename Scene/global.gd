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
	
func MenuAudioP():
	$MenuAudio.play()
func MenuAudioS():
	$MenuAudio.stop()

func FloatingPlay():
	$Floating.play()
func FloatingStop():
	$Floating.stop()
	
func DragP():
	$SixToNine.play()
func DragS():
	$SixToNine.stop()

func BassP():
	$BassSound.play()
func GuitarP():
	$GuitarSound.play()
func DrumP():
	$DrumSound.play()
func TurntableP():
	$TurntableSound.play()

func submit_total_score(score : int):
	PlayIntegration.unlock_achievements(score)
	PlayIntegration.achievementsSteps(score)
