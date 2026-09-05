extends CharacterBody2D

@onready var ball: CharacterBody2D = $"../Ball"

var speed := 5
var delay := 0.5
var time := 0.0
var offset := 0.0
var target := 0.0


func _physics_process(delta:float) -> void:
	var ball_direction = global_position.direction_to(ball.global_position)
	if ball_direction.y >= 0:
		velocity.y = 300
	else:
		velocity.y = -300
		
	move_and_slide()
	#time += delta
	#if time >= delay:
		#time = 0
		#delay = randf_range(0, 0.5)
		#offset = randf_range(-40, 40)
		 #
	#target = ball.global_position.y + offset
	#global_position.y = lerpf(global_position.y, target, speed * delta)
