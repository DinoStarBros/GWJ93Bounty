extends State

func enter() -> void:
	state_duration = 0.5

func physics_update(delta: float) -> void:
	if p is Enemy:
		%anims.play("walk")
		
		state_duration = max(state_duration - delta, 0)
		if state_duration <= 0:
			state_machine.change_state("FlameWindup")
		
		#if p.get_dist_to_plr() <= p.tdev_range - 50:
		#	state_machine.change_state("FlameWindup")
		#else:
			#p.velocity = p.get_dir_tdev_player() * p.move_speed
		
		p.velocity = p.get_dir_to_plr() * p.move_speed
