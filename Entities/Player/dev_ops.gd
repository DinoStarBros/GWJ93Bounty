extends CanvasLayer
class_name DevOps

@export var p : Player

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if !OS.is_debug_build(): return
	visible = Input.is_action_pressed("Devops")

var spawn_buttons : Array[Button] = [
	
]
