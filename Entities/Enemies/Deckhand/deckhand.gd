extends Enemy
class_name Deckhand

func _ready() -> void:
	setup_hitbox()

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	%sprite.flip_h = get_dir_to_plr().x < 0
