extends Node2D

var score_player : int = 0
var score_bot : int = 0

@onready var score_label : Label = $CanvasLayer/ScoreLabel

func _on_goal_1_body_entered(body):
	body.global_position = Vector2(462, 307)
	body.direction = Vector2(-1, -1).normalized()
	score_bot += 1


func _on_goal_2_body_entered(body):
	body.global_position = Vector2(462, 307)
	body.direction = Vector2(-1, -1).normalized()
	score_player += 1
	
func update_score():
	score_label.text = str(score_player) + " X " + str(score_bot)
	
