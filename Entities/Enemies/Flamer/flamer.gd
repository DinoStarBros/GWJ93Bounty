extends Enemy
class_name Flamer

func _ready() -> void:
	setup_hitbox()

func _physics_process(delta: float) -> void:
	move_and_slide()
