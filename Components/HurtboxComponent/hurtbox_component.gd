extends Area2D
class_name HurtboxComponent

@export var health_component : HealthComponent

func _ready() -> void:
	pass

func hurt(attack : Attack) -> void:
	health_component.hurt(attack)
