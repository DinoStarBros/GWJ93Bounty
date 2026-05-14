extends Node2D
## We got components in components HELL YEAH
class_name SFXPlayers


func play_enemy_hurt_sfx() -> void:
	SfxManager.play_2d_sfx(SfxManager.sfx_types.EnemyHit1, global_position)
	SfxManager.play_2d_sfx(SfxManager.sfx_types.EnemyHit2, global_position)
	SfxManager.play_2d_sfx(SfxManager.sfx_types.EnemyHit3, global_position)

func play_enemy_dead_sfx() -> void:
	SfxManager.play_2d_sfx(SfxManager.sfx_types.EnemyDead1, global_position)

func play_player_hurt_sfx() -> void:
	SfxManager.play_2d_sfx(SfxManager.sfx_types.PlayerHit1, global_position)
	SfxManager.play_2d_sfx(SfxManager.sfx_types.PlayerHit2, global_position)
	SfxManager.play_2d_sfx(SfxManager.sfx_types.PlayerHit3, global_position)

func play_player_dead_sfx() -> void:
	play_player_hurt_sfx()
	SfxManager.play_2d_sfx(SfxManager.sfx_types.PlayerDead1, global_position)
	SfxManager.play_2d_sfx(SfxManager.sfx_types.PlayerDead2, global_position)
