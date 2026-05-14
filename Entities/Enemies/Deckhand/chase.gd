extends State

const chase_speed : float = 300

func _ready() -> void:
	pass

func physics_update(delta: float) -> void:
	if p is Enemy:
		
		if p.get_dist_to_plr() <= p.tdev_range:
			p.velocity = p.get_dir_to_plr() * chase_speed
		else:
			p.velocity = p.get_dir_tdev_player() * chase_speed
