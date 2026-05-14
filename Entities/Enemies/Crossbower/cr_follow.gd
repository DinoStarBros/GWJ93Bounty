extends State

func physics_update(delta: float) -> void:
	if p is Enemy:	
		
		if p.get_dist_to_plr() <= p.tdev_range * 2:
			state_machine.change_state("ShootWindup")
		else:
			p.velocity = p.get_dir_tdev_player() * p.move_speed
