extends Projectile
class_name BurnGround

@onready var hitbox_component: HitboxComponent = %HitboxComponent

func _ready() -> void:
	hitbox_component.attack.attack_damage = 2
	hitbox_component.attack.knockback = 0
	hitbox_component.attack.stun_duration = 0.2

func _on_timer_timeout() -> void:
	queue_free()
