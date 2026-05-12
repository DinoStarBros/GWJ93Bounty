extends State

func enter() -> void:
	p.velocity = p.last_wasd_input * p.dash_speed
	state_duration = p.dash_duration
	
	%dashSfx.pitch_scale = 1 + randf_range(-.1,.1)
	%dashSfx.play()

func physics_update(delta: float) -> void:
	p.velocity *= 0.95
	state_duration = max(state_duration - delta, 0)
	if state_duration <= 0:
		state_machine.change_state("Walk")
