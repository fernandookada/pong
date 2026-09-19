extends Node2D

signal game_over

var score_player : int = 0
var score_bot : int = 0
var max_score : int = 3

@onready var score_label : Label = $CanvasLayer/ScoreLabel
@onready var player_score_sound = $PlayerScoreSound
@onready var bot_score_sound = $BotScoreSound
@onready var results_screen = %ResultsScreen
@onready var results = %Results

func _ready():
	results_screen.hide()


func _on_goal_1_body_entered(body):
	body.global_position = Vector2(462, 307)
	body.direction = Vector2(-1, randf_range(-1, 1)).normalized()
	score_bot += 1
	bot_score_sound.play()
	update_score()


func _on_goal_2_body_entered(body):
	body.global_position = Vector2(462, 307)
	
	body.direction = Vector2(-1, randf_range(-1, 1)).normalized()
	score_player += 1
	player_score_sound.play()
	update_score()
	
func update_score():
	score_label.text = str(score_player) + " X " + str(score_bot)
	if score_player >= max_score or score_bot >= max_score:
		results_screen.show()
		results.text = "%s" % "[wave]Vitória![/wave]" if score_player > score_bot else "[shake]Derrota![/shake]"
		results.text += "\n[center]%s / %s" % [score_player, score_bot]
		game_over.emit()


func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
