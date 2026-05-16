extends Node2D
## We got components in components HELL YEAH
class_name SFXPlayers

const item_spawn_range : float = 50

func play_enemy_hurt_sfx() -> void:
	SfxManager.play_2d_sfx(SfxManager.sfx_types.EnemyHit1, global_position)
	SfxManager.play_2d_sfx(SfxManager.sfx_types.EnemyHit2, global_position)
	SfxManager.play_2d_sfx(SfxManager.sfx_types.EnemyHit3, global_position)

func play_enemy_dead_sfx() -> void:
	SfxManager.play_2d_sfx(SfxManager.sfx_types.EnemyDead1, global_position)
	spawn_multiple_items(2,3)
	for n in randi_range(3,6):
		spawn_coin()

func play_player_hurt_sfx() -> void:
	SfxManager.play_2d_sfx(SfxManager.sfx_types.PlayerHit1, global_position)
	SfxManager.play_2d_sfx(SfxManager.sfx_types.PlayerHit2, global_position)
	SfxManager.play_2d_sfx(SfxManager.sfx_types.PlayerHit3, global_position)

func play_player_dead_sfx() -> void:
	play_player_hurt_sfx()
	SfxManager.play_2d_sfx(SfxManager.sfx_types.PlayerDead1, global_position)
	SfxManager.play_2d_sfx(SfxManager.sfx_types.PlayerDead2, global_position)

func spawn_multiple_items(minim:int, maxim:int) -> void:
	for n in randi_range(minim,maxim):
		Global.items_parent.spawn_random(
			global_position + 
			Vector2(
				randf_range(-item_spawn_range, item_spawn_range),
				randf_range(-item_spawn_range, item_spawn_range)
			)
		)

func spawn_coin() -> void:
	Global.items_parent.spawn_coin(
		global_position + 
		Vector2(
			randf_range(-item_spawn_range, item_spawn_range),
			randf_range(-item_spawn_range, item_spawn_range)
		)
	)
