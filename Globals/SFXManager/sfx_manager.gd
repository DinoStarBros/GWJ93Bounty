extends Node
class_name SFXManagerClass

enum sfx_types {
	EnemyHit1, EnemyHit2, EnemyHit3, EnemyDead1,
	PlayerHit1, PlayerHit2, PlayerHit3, PlayerDead1, PlayerDead2
}

const sfxs : Dictionary = {
	sfx_types.EnemyHit1 : 
		preload("res://Globals/SFXManager/SFXResources/enemy_hit1.tres"),
	sfx_types.EnemyHit2 : 
		preload("res://Globals/SFXManager/SFXResources/enemy_hit2.tres"),
	sfx_types.EnemyHit3 : 
		preload("res://Globals/SFXManager/SFXResources/enemy_hit3.tres"),
	sfx_types.EnemyDead1 :
		preload("res://Globals/SFXManager/SFXResources/enemy_dead1.tres"),
	sfx_types.PlayerHit1:
		preload("res://Globals/SFXManager/SFXResources/player_hit1.tres"),
	sfx_types.PlayerHit2:
		preload("res://Globals/SFXManager/SFXResources/player_hit2.tres"),
	sfx_types.PlayerHit3:
		preload("res://Globals/SFXManager/SFXResources/player_hit3.tres"),
	sfx_types.PlayerDead1:
		preload("res://Globals/SFXManager/SFXResources/player_dead1.tres"),
	sfx_types.PlayerDead2:
		preload("res://Globals/SFXManager/SFXResources/player_dead2.tres"),
}

const sfx_scn : PackedScene = preload("res://Scenes/SFX/sfx.tscn")
const sfx2d_scn : PackedScene = preload("res://Scenes/SFX2d/sfx_2d.tscn")

func play_sfx(sound: sfx_types) -> void:
	var sfx_res : SFXResource = sfxs[sound]
	var sfx : SFX2D = sfx_scn.instantiate()
	sfx.stream = sfx_res.audio_stream
	sfx.volume_db = sfx_res.volume
	sfx.pitch_scale = max(
		0.01,
		sfx_res.pitch + randf_range(
			-sfx_res.random_pitch_range, sfx_res.random_pitch_range
			)
		)
	sfx.start_point = sfx_res.start_point
	
	Global.projectiles_parent.add_child(sfx)

func play_2d_sfx(sound: sfx_types, pos: Vector2) -> void:
	var sfx_res : SFXResource = sfxs[sound]
	var sfx2d : SFX2D = sfx2d_scn.instantiate()
	sfx2d.stream = sfx_res.audio_stream
	sfx2d.volume_db = sfx_res.volume
	sfx2d.pitch_scale = max(
		0.01,
		sfx_res.pitch + randf_range(
			-sfx_res.random_pitch_range, sfx_res.random_pitch_range
			)
		)
	sfx2d.start_point = sfx_res.start_point
	
	sfx2d.global_position = pos
	
	Global.projectiles_parent.add_child(sfx2d)
