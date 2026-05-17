extends State

func enter() -> void:
	if p is Player:
		%anims.play("hurt")

func physics_update(delta: float) -> void:
	p.velocity *= 0.9
	
	state_duration = max(state_duration - delta, 0)
	if state_duration <= 0:
		#state_machine.change_state("Idle")
		state_machine.change_state(
			state_machine.initial_state.name
		)
