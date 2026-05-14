extends Entity
class_name Enemy

const tdev_range : float = 100

func get_dir_to_plr() -> Vector2:
	return global_position.direction_to(Global.player.global_position)

func get_dist_to_plr() -> float:
	return global_position.distance_to(Global.player.global_position)

func _get_tdev_vec2() -> Vector2:
	return Vector2(
		randf_range(-tdev_range, -tdev_range),
		randf_range(-tdev_range, -tdev_range)
	) * 0.5

func get_dir_tdev_player() -> Vector2:
	return global_position.direction_to(
		Global.player.global_position + _get_tdev_vec2()
		)
