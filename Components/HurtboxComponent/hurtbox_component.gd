extends Area2D
class_name HurtboxComponent

signal Hurt(attack: Attack)

@export var health_component : HealthComponent
@export var knockback_stun_component : KnockbackStunComponent

@onready var sfx_players: SFXPlayers = %SFXPlayers

var allow_hurt : bool = true
var colliders : Array

func _ready() -> void:
	for n in get_children():
		if is_collider(n):
			colliders.append(n)

func hurt(attack : Attack) -> void:
	if !allow_hurt: return
	allow_hurt = false
	
	Hurt.emit(attack)
	
	health_component.hurt(attack)
	
	Global.spawn_txt(roundi(attack.attack_damage), global_position)
	_spawn_hitspark(attack)
	
	if knockback_stun_component:
		knockback_stun_component.hurt(attack)
	
	if get_parent() is Enemy:
		sfx_players.play_enemy_hurt_sfx()
		if health_component.hp <= 0:
			sfx_players.play_enemy_dead_sfx()
	elif get_parent() is Player:
		sfx_players.play_player_hurt_sfx()
		if health_component.hp <= 0:
			sfx_players.play_player_dead_sfx()
			get_parent().dead = true
	
	await get_tree().physics_frame
	allow_hurt = true

func _spawn_hitspark(attack: Attack) -> void:
	var hitspark : Hitspark = References.hitspark_scn.instantiate()
	hitspark.global_position = global_position
	hitspark.look_at(Global.player.global_position)
	hitspark.rotation += PI
	Global.projectiles_parent.add_child(hitspark)

func is_collider(node: Node) -> bool:
	return node is CollisionShape2D or node is CollisionPolygon2D
