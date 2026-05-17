extends State

func enter() -> void:
	if p is Player:
		
		p.velocity = p.last_wasd_input * p.dash_speed
		state_duration = p.dash_duration
		
		%dashSfx.pitch_scale = 1 + randf_range(-.1,.1)
		%dashSfx.play()
		
		await get_tree().process_frame
		
		%anims.play("dash")

func physics_update(delta: float) -> void:
	if p is Player:
		
		p.velocity *= 0.9
		state_duration = max(state_duration - delta, 0)
		if state_duration <= 0:
			state_machine.change_state("Walk")
