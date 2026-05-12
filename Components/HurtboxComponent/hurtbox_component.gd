extends Area2D
class_name HurtboxComponent

@export var health_component : HealthComponent
@export var knockback_stun_component : KnockbackStunComponent

@onready var sfx_players: SFXPlayers = %SFXPlayers

func _ready() -> void:
	pass

func hurt(attack : Attack) -> void:
	health_component.hurt(attack)
	
	Global.spawn_txt(roundi(attack.attack_damage), global_position)
	_spawn_hitspark(attack)
	
	if knockback_stun_component:
		knockback_stun_component.hurt(attack)
	
	if get_parent() is Enemy:
		sfx_players.play_enemy_hurt_sfx()
	elif get_parent() is Player:
		pass

func _spawn_hitspark(attack: Attack) -> void:
	var hitspark : Hitspark = References.hitspark_scn.instantiate()
	hitspark.global_position = global_position
	hitspark.look_at(Global.player.global_position)
	hitspark.rotation += PI
	Global.projectiles_parent.add_child(hitspark)
