extends Node
## We got components in components HELL YEAH
class_name SFXPlayers

@onready var enemy_hurt_sfx: AudioStreamPlayer2D = %EnemyHurtSFX
@onready var enemy_hurt_sfx_2: AudioStreamPlayer2D = %EnemyHurtSFX2

func play_enemy_hurt_sfx() -> void:
	enemy_hurt_sfx.pitch_scale = 1.2 + randf_range(-.2,.2)
	enemy_hurt_sfx.play()
	
	enemy_hurt_sfx_2.pitch_scale = 0.6 + randf_range(-.2,.2)
	enemy_hurt_sfx_2.play()
