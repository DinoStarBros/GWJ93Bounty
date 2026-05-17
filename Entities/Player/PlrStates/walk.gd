extends State

func physics_update(delta: float) -> void:
	p.velocity = p.get_wasd_input() * p.move_speed
	
	if Input.is_action_just_pressed("Dash"):
		state_machine.change_state("Dash")
	
	if p.get_wasd_input() == Vector2.ZERO:
		%anims.play("idle")
	else:
		%anims.play("walk")
