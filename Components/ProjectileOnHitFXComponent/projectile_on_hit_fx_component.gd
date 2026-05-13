extends Node2D
class_name ProjectileOnHitFX

@export var projectile : ProjectileItem

func spawn_on_hit() -> void:
	call_deferred("deferred_bullcrap")

func deferred_bullcrap() -> void:
	var on_hit : Projectile = projectile.item_resource.on_hit_scn.instantiate()
	on_hit.global_position = global_position
	Global.projectiles_parent.add_child(on_hit)
