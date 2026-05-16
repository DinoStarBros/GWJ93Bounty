extends Projectile
class_name SupplyCrate

var is_go_to_suck : bool = false
var dir_to_plr : Vector2

const move_speed : float = 700
const item_spawn_range : float = 50

func _physics_process(delta: float) -> void:
	dir_to_plr = global_position.direction_to(Global.player.global_position + Vector2(0, -32))
	
	if is_go_to_suck:
		velocity = dir_to_plr * move_speed
	else:
		velocity *= 0.8
	
	_move(delta)

func _on_suck_area_area_entered(area: Area2D) -> void:
	is_go_to_suck = true

func _on_suck_area_area_exited(area: Area2D) -> void:
	is_go_to_suck = false

func destroy() -> void:
	SfxManager.play_2d_sfx(SfxManager.sfx_types.CrateBreak, global_position)
	for n in randi_range(4,6):
		_spawn_wood_shrapnel()
	
	spawn_multiple_items(7, 10)
	Global.camera.screen_shake(10, 0.1)
	
	queue_free()

func _on_player_break_area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		if area.get_parent() is Player:
			destroy()

func _spawn_wood_shrapnel() -> void:
	var wood_shrapnel : WoodShrapnel = References.wood_shrapnel_scn.instantiate()
	wood_shrapnel.global_position = global_position
	Global.projectiles_parent.add_child(wood_shrapnel)

func spawn_multiple_items(minim:int, maxim:int) -> void:
	for n in randi_range(minim,maxim):
		Global.items_parent.spawn_random(
			global_position + 
			Vector2(
				randf_range(-item_spawn_range, item_spawn_range),
				randf_range(-item_spawn_range, item_spawn_range)
			)
		)

func _on_hb_break_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		destroy()
