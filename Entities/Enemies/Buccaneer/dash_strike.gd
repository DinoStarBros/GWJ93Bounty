extends State

func enter() -> void:
	state_duration = 0.7
	%anims.play("dash")
	if p is Enemy:
		p.velocity = p.get_dir_to_plr() * p.move_speed * 6

func physics_update(delta: float) -> void:
	p.velocity *= 0.9
	
	state_duration = max(state_duration - delta, 0)
	if state_duration <= 0:
		#state_machine.change_state("DashStrike")
		state_machine.change_state(
			state_machine.initial_state.name
		)
