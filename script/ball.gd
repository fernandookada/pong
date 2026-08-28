extends CharacterBody2D

var direction: Vector2 = Vector2(-1, -1).normalized()
var speed: float = 500

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()

	if get_last_slide_collision() != null:
		var collision = get_last_slide_collision()
		if collision.get_collider().name == "Wall":
			direction.y *= -1
		else:
			direction.x *= -1
		#print("Collided with: ", collision.get_collider().name)
