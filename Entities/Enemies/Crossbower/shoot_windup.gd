extends State

func enter() -> void:
	state_duration = 0.4
	%anims.play("shootWindup")

func physics_update(delta: float) -> void:
	p.velocity *= 0.9
	
	state_duration = max(state_duration - delta, 0)
	if state_duration <= 0:
		state_machine.change_state("Shoot")
