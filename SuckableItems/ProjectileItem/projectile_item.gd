extends Projectile
class_name ProjectileItem

@onready var sprite: Sprite2D = %Sprite2D
@onready var hitbox_component: HitboxComponent = %HitboxComponent

@export var projectile_bounce_component: ProjectileBounceComponent

var item_resource : SuckableItemResource

func _ready() -> void:
	sprite.texture = item_resource.texture
	sprite.self_modulate = item_resource.color
	%LifeTimer.timeout.connect(
		func():
			queue_free()
	)
	
	hitbox_component.attack.attack_damage = item_resource.damage
	hitbox_component.attack.knockback = item_resource.knockback
	hitbox_component.hits = item_resource.hits
	hitbox_component.attack.stun_duration = item_resource.stun_duration
	
	scale.x = item_resource.item_size
	scale.y = item_resource.item_size
	
	hitbox_component.Hit.connect(_hit)

func _physics_process(delta: float) -> void:
	_move(delta)

func _hit(attack: Attack) -> void:
	if item_resource.bounce:
		velocity = (
			projectile_bounce_component.get_direction_to_next_target() *
			item_resource.speed
		)
