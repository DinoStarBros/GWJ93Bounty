extends Projectile
class_name CrossbowBolt

@onready var hitbox_component: HitboxComponent = %HitboxComponent

func _ready() -> void:
	hitbox_component.attack.attack_damage = 1
	hitbox_component.attack.knockback = 300
	hitbox_component.attack.stun_duration = 0.4
	
	await get_tree().process_frame
	
	look_at(global_position + velocity)

func _physics_process(delta: float) -> void:
	_move(delta)
