extends State

func physics_update(delta: float) -> void:
	p.velocity = p.get_wasd_input() * p.move_speed
