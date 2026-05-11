extends Entity
class_name Player

func _ready() -> void:
	Global.player = self

func _physics_process(delta: float) -> void:
	move_and_slide()

func get_wasd_input() -> Vector2:
	return (
		Input.get_vector("Left", "Right", "Up", "Down")
	)
