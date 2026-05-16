extends State

const enemy_burn_ground_scn : PackedScene = preload("res://Projectiles/EnemyBurnGround/enemy_burn_ground.tscn")

func enter() -> void:
	state_duration = 0.7
	_spawn_enemy_burn_ground()

func physics_update(delta: float) -> void:
	p.velocity *= 0.9
	
	state_duration = max(state_duration - delta, 0)
	if state_duration <= 0:
		#state_machine.change_state("Idle")
		state_machine.change_state(
			state_machine.initial_state.name
		)

func _spawn_enemy_burn_ground() -> void:
	var enemy_burn_ground : EnemyBurnGround = enemy_burn_ground_scn.instantiate()
	enemy_burn_ground.global_position = p.global_position
	Global.projectiles_parent.add_child(enemy_burn_ground)
