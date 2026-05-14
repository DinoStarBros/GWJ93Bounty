extends Entity
class_name Enemy

@export_category("Contact Damage Stuff")
@export var hitbox_component: HitboxComponent
@export var attack_damage : float = 1
@export var knockback : float = 500
@export var stun_duration : float = 0.3

const tdev_range : float = 200

func setup_hitbox() -> void:
	if hitbox_component:
		hitbox_component.attack.attack_damage = attack_damage
		hitbox_component.attack.knockback = knockback
		hitbox_component.attack.stun_duration = stun_duration

func get_dir_to_plr() -> Vector2:
	return global_position.direction_to(Global.player.global_position)

func get_dist_to_plr() -> float:
	return global_position.distance_to(Global.player.global_position)

func _get_tdev_vec2() -> Vector2:
	return Vector2(
		randf_range(-tdev_range, tdev_range),
		randf_range(-tdev_range, tdev_range)
	) * 0.8

var tdev_vec2 : Vector2 = _get_tdev_vec2()

func get_dir_tdev_player() -> Vector2:
	return global_position.direction_to(
		Global.player.global_position + tdev_vec2
		)
