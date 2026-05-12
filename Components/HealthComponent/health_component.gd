extends Node2D
class_name HealthComponent

@export var max_hp : float = 50
var hp : float = max_hp

func _ready() -> void:
	hp = max_hp

func hurt(attack:Attack) -> void:
	hp -= attack.attack_damage
	if get_parent() is Enemy:
		if hp <= 0:
			get_parent().queue_free()
