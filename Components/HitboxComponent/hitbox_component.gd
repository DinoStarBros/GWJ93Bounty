extends Area2D
class_name HitboxComponent

## If the parent is a projectile
## How many times it can pierce before queue_freeing the projectile
var pierce_amount : int = 1

var attack : Attack = Attack.new()

func _ready() -> void:
	area_entered.connect(_area_entered)

func _area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		attack.attack_pos = global_position
		area.hurt(attack)
		
		if get_parent() is Projectile:
			projectile_pierce_handling()

func projectile_pierce_handling() -> void:
	pierce_amount -= 1
	if pierce_amount <= 0:
		get_parent().queue_free()
