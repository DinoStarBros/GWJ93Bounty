extends Area2D
class_name ProjectileBounceComponent

@export var projectile : ProjectileItem

var next_target : Enemy

func _ready() -> void:
	area_entered.connect(_area_entered)

func _area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		if area.get_parent() is Enemy:
			next_target = area.get_parent()

func get_direction_to_next_target() -> Vector2:
	if next_target:
		return global_position.direction_to(next_target.global_position)
	else:
		return global_position.direction_to(get_global_mouse_position())
