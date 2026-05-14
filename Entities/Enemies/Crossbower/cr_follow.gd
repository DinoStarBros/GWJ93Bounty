extends State

func physics_update(delta: float) -> void:
	if p is Enemy:
		
		if p.get_dist_to_plr() <= p.tdev_range:
			p.velocity = p.get_dir_to_plr() * p.move_speed
		else:
			p.velocity = p.get_dir_tdev_player() * p.move_speed
