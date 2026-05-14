extends State

var dir_facing : Vector2

func physics_update(delta: float) -> void:
	if p is Enemy:
		
		if p.get_dist_to_plr() <= p.tdev_range:
			dir_facing = lerp(dir_facing, p.get_dir_to_plr(), 2.0 * delta)
		else:
			dir_facing = lerp(dir_facing, p.get_dir_tdev_player(), 2.0 * delta)
		p.velocity = dir_facing * p.move_speed
