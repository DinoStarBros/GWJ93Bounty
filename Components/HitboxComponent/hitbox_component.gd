extends Area2D
class_name HitboxComponent

func _ready() -> void:
	area_entered.connect(_area_entered)

func _area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		area.hurt()
