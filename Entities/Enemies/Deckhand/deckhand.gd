extends Enemy
class_name Deckhand

@onready var hitbox_component: HitboxComponent = %HitboxComponent

func _ready() -> void:
	hitbox_component.attack.attack_damage = 1
	hitbox_component.attack.knockback = 500
	hitbox_component.attack.stun_duration = 0.3

func _physics_process(delta: float) -> void:
	move_and_slide()
