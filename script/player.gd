extends CharacterBody2D

var max_speed: float = 500
var speed: float = 0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_up", "move_down")
	velocity.y = direction * speed
	move_and_slide()
	
	if absf(direction) >= 0.1:
		speed = lerpf(speed, max_speed, 100 * delta)
	else:
		speed = lerpf(speed, max_speed, 100 * delta)
