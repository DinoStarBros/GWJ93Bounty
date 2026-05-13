extends Area2D
class_name HitboxComponent

@export var parent_projectile : Projectile
@export var projectile_bounce_component: ProjectileBounceComponent
@export var projectile_on_hit_fx_component: ProjectileOnHitFX

signal Hit(attack: Attack)

## If the parent is a projectile
## How many times it can pierce before queue_freeing the projectile
var hits : int = 1

var attack : Attack = Attack.new()

func _ready() -> void:
	area_entered.connect(_area_entered)

func _area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		attack.attack_pos = global_position
		area.hurt(attack)
		Hit.emit(attack)
		
		if parent_projectile:
			if parent_projectile is ProjectileItem:
				projectile_item_handling()

func projectile_hits_handling() -> void:
	hits -= 1
	if hits <= 0:
		get_parent().queue_free()

func projectile_item_handling() -> void:
	projectile_hits_handling()
	if parent_projectile.item_resource.on_hit_scn:
		projectile_on_hit_fx_component.spawn_on_hit()
	
	if parent_projectile.item_resource.bounce:
		parent_projectile.velocity = (
			projectile_bounce_component.get_direction_to_next_target() *
			parent_projectile.item_resource.speed
		)
