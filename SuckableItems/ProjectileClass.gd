extends Node2D
class_name Projectile

var velocity : Vector2
var rotational_velocity : float

func _move(delta: float) -> void:
	global_position += delta * velocity

func _rotate_vel(delta: float) -> void:
	rotation_degrees += delta * rotational_velocity
