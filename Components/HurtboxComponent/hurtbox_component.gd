extends Area2D
class_name HurtboxComponent

@export var health_component : HealthComponent
@onready var enemy_hurt_sfx: AudioStreamPlayer2D = %EnemyHurtSFX

func _ready() -> void:
	pass

func hurt(attack : Attack) -> void:
	health_component.hurt(attack)
	
	Global.spawn_txt(roundi(attack.attack_damage), global_position)
	_spawn_hitspark(attack)
	
	if get_parent() is Enemy:
		enemy_hurt_sfx.play()
	elif get_parent() is Player:
		pass

func _spawn_hitspark(attack: Attack) -> void:
	var hitspark : Hitspark = References.hitspark_scn.instantiate()
	hitspark.global_position = global_position
	hitspark.look_at(attack.attack_pos)
	hitspark.rotation += PI
	Global.projectiles_parent.add_child(hitspark)
