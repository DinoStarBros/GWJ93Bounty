extends Sprite2D
class_name SuckParticle

var velocity : Vector2

func _physics_process(delta: float) -> void:
	_move(delta)

func _move(delta: float) -> void:
	global_position += delta * velocity
