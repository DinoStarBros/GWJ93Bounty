extends Node2D
class_name StatsAllocator

@export_category("Stats Resource")
@export var stats : EntityStatsResource

@export_category("Components")
@export var hitbox_component : HitboxComponent
@export var hurtbox_component : HurtboxComponent
@export var health_component : HealthComponent

func _ready() -> void:
	await get_tree().process_frame
	
	if hitbox_component:
		pass
	
	if hurtbox_component:
		pass
	
	if health_component:
		health_component.max_hp = stats.max_hp
