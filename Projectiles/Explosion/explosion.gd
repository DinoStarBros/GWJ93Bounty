extends Projectile
class_name Explosion

@onready var hitbox_component: HitboxComponent = %HitboxComponent

func _ready() -> void:
	%sfx.pitch_scale += randf_range(-.2,.2)
	hitbox_component.attack.attack_damage = 10
	hitbox_component.attack.knockback = 1000
	hitbox_component.attack.stun_duration = 0.5
	Global.camera.screen_shake(10, 0.1)
