extends State

func physics_update(delta: float) -> void:
	p.velocity = p.get_wasd_input() * p.move_speed
	
	if Input.is_action_just_pressed("Dash"):
		state_machine.change_state("Dash")
