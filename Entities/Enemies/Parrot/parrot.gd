extends Enemy
class_name Parrot

@onready var hurtbox_component: HurtboxComponent = %HurtboxComponent

func _ready() -> void:
	setup_hitbox()
	caw_sfx()
	hurtbox_component.Hurt.connect(hurt_caw_sfx)

func hurt_caw_sfx(attack : Attack) -> void:
	caw_sfx()

func caw_sfx() -> void:
	SfxManager.play_2d_sfx(SfxManager.sfx_types.BirdCaw, global_position)

func _physics_process(delta: float) -> void:
	move_and_slide()
