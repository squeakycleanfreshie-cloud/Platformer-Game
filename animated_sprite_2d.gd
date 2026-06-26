extends AnimatableBody2D

@export var move_distance := Vector2(200, 0)  # direction + how far
@export var duration := 2.0                    # seconds one way

func _ready():
	_move()

func _move():
	var tween = create_tween().set_loops()
	tween.tween_property(self, "position", position + move_distance, duration)\
		 .set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position", position, duration)\
		 .set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
