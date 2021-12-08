extends Node
var play_games_services

func _ready():
	if Engine.has_singleton("GodotPlayGamesServices"):
		play_games_services = Engine.get_singleton("GodotPlayGamesServices")
	var show_popups := true
	var request_email := true
	var request_profile := true
	var request_token := ""

#	play_games_services.connect("_on_sign_in_success", self, "_on_sign_in_success")
#	play_games_services.connect("_on_sign_in_failed", self, "_on_sign_in_failed")
#	play_games_services.init(show_popups, request_email, request_profile, request_token)	  

func sign_in():
	if play_games_services:
		play_games_services.signIn()

func _on_sign_in_success(userProfile_json: String) -> void:
	var userProfile = parse_json(userProfile_json)

	userProfile["displayName"]
	userProfile["email"]
	userProfile["id"]

func _on_sign_in_failed(error_code: int) -> void:
	pass
	
var yo_jaturas = "CgkI38i5gaEaEAIQCA"
var Total_Bronze = "CgkI38i5gaEaEAIQAQ"
var Total_Silver = "CgkI38i5gaEaEAIQAg"
var Total_Gold = "CgkI38i5gaEaEAIQAw"
var Mno_Bass_Bronze = "CgkI38i5gaEaEAIQBA"
var Mno_Bass_Silver = "CgkI38i5gaEaEAIQCQ"
var Mno_Bass_Gold = "CgkI38i5gaEaEAIQCg"
var Speng_Guitar_Bronze = "CgkI38i5gaEaEAIQBQ"
var Speng_Guitar_Silver = "CgkI38i5gaEaEAIQCw"
var Speng_Guitar_Gold = "CgkI38i5gaEaEAIQDA"
var Olay_Drum_Bronze = "CgkI38i5gaEaEAIQBg"
var Olay_Drum_Silver = "CgkI38i5gaEaEAIQDQ"
var Olay_Drum_Gold = "CgkI38i5gaEaEAIQDg"
var Ichuen_Turnable_Bronze = "CgkI38i5gaEaEAIQBw"
var Ichuen_Turnable_Silver = "CgkI38i5gaEaEAIQDw"
var Ichuen_Turnable_Gold = "CgkI38i5gaEaEAIQEA"


func unlock_achievements(score : int):
	if score > 4:
		play_games_services.unlockAchievement(yo_jaturas)

func achievementsSteps(score : int):
	play_games_services.setAchievementSteps(Total_Bronze, score)
	play_games_services.setAchievementSteps(Total_Silver, score)
	play_games_services.setAchievementSteps(Total_Gold, score)

func achievementsStepsMno(score : int):
	play_games_services.setAchievementSteps(Mno_Bass_Bronze, score)
	play_games_services.setAchievementSteps(Mno_Bass_Silver, score)
	play_games_services.setAchievementSteps(Mno_Bass_Gold, score)
	
func achievementsStepsSpeng(score : int):
	play_games_services.setAchievementSteps(Speng_Guitar_Bronze, score)
	play_games_services.setAchievementSteps(Speng_Guitar_Silver, score)
	play_games_services.setAchievementSteps(Speng_Guitar_Gold, score)
	
func achievementsStepsOlay(score : int):	
	play_games_services.setAchievementSteps(Olay_Drum_Bronze, score)
	play_games_services.setAchievementSteps(Olay_Drum_Silver, score)
	play_games_services.setAchievementSteps(Olay_Drum_Gold, score)
	
func achievementsStepsIchuen(score : int):	
	play_games_services.setAchievementSteps(Ichuen_Turnable_Bronze, score)
	play_games_services.setAchievementSteps(Ichuen_Turnable_Silver, score)
	play_games_services.setAchievementSteps(Ichuen_Turnable_Gold, score)
	
func showAchievement():
	play_games_services.showAchievements()
	

