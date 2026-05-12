extends Enemy
class_name Dummy

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()
