extends CharacterBody2D

@onready var ball: CharacterBody2D = $"../Ball"

var delay := 0.5
var time := 0.0
var offset := 0.0
var target := 0.0


func _physics_process(delta:float) -> void:
	time += delta
	if time >= delay:
		time = 0
		delay = randf_range(0, 0.5)
		offset = randf_range(-30, 30)
		 
	target = ball.global_position.y + offset
	global_position.y = lerpf(global_position.y, target, 5 * delta)
