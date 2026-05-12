extends Projectile
class_name ProjectileItem

@onready var sprite: Sprite2D = %Sprite2D
@onready var hitbox_component: HitboxComponent = %HitboxComponent

var item_resource : SuckableItemResource
var knockback : float = 400
var damage : float = 10

func _ready() -> void:
	sprite.texture = item_resource.texture
	sprite.self_modulate = item_resource.color
	%LifeTimer.timeout.connect(
		func():
			queue_free()
	)
	
	hitbox_component.attack.attack_damage = damage
	hitbox_component.attack.knockback = knockback

func _physics_process(delta: float) -> void:
	_move(delta)
