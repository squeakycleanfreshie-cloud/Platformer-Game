extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -250.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

	if not is_on_floor():
		anim.play("jump")
	elif velocity.x != 0:
		anim.play("run")
	else:
		anim.play("idle")

	if velocity.x < 0:
		anim.flip_h = true
	elif velocity.x > 0:
		anim.flip_h = false
