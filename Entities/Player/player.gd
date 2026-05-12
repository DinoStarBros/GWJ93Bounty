extends Entity
class_name Player

var last_wasd_input : Vector2

func _ready() -> void:
	Global.player = self

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	if get_wasd_input() != Vector2.ZERO:
		last_wasd_input = get_wasd_input()

func get_wasd_input() -> Vector2:
	return (
		Input.get_vector("Left", "Right", "Up", "Down")
	)
