extends Projectile
class_name ProjectileItem

@onready var sprite: Sprite2D = %Sprite2D
@onready var hitbox_component: HitboxComponent = %HitboxComponent



var item_resource : SuckableItemResource

func _ready() -> void:
	sprite.texture = item_resource.texture
	sprite.self_modulate = item_resource.color
	%LifeTimer.timeout.connect(
		func():
			queue_free()
	)
	
	hitbox_component.attack.attack_damage = item_resource.damage * Global.player.damage_mult
	hitbox_component.attack.knockback = item_resource.knockback
	hitbox_component.hits = item_resource.hits
	hitbox_component.attack.stun_duration = item_resource.stun_duration
	
	scale.x = item_resource.item_size * 1.5
	scale.y = item_resource.item_size * 1.5

func _physics_process(delta: float) -> void:
	_move(delta)
