extends State

const crossbow_bolt_scn : PackedScene = preload("res://Projectiles/CrossbowBolt/crossbow_bolt.tscn")

func enter() -> void:
	state_duration = 0.7
	SfxManager.play_2d_sfx(SfxManager.sfx_types.CrossbowShot, p.global_position)
	if p is Enemy:
		p.velocity = p.get_dir_to_plr() * -p.move_speed * 3
		shoot_crossbow_bolt()
	
	%anims.play("shoot")

func physics_update(delta: float) -> void:
	p.velocity *= 0.9
	
	state_duration = max(state_duration - delta, 0)
	if state_duration <= 0:
		state_machine.change_state(state_machine.initial_state.name)

func shoot_crossbow_bolt() -> void:
	if p is Enemy:
		var crossbow_bolt : CrossbowBolt = crossbow_bolt_scn.instantiate()
		crossbow_bolt.global_position = p.global_position
		crossbow_bolt.velocity = p.get_dir_to_plr() * p.move_speed * 3
		Global.projectiles_parent.add_child(crossbow_bolt)
