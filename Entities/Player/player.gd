extends Entity
class_name Player

@onready var hurtbox: CollisionShape2D = %hurtbox
@onready var hurtbox_component: HurtboxComponent = %HurtboxComponent

var last_wasd_input : Vector2
var iframes : float

func _ready() -> void:
	Global.player = self
	hurtbox_component.Hurt.connect(
		func(attack: Attack):
			iframes = 1
	)

func _physics_process(delta: float) -> void:
	iframes = max(iframes - delta, 0)
	hurtbox.disabled = iframes > 0
	
	move_and_slide()
	
	if get_wasd_input() != Vector2.ZERO:
		last_wasd_input = get_wasd_input()

func get_wasd_input() -> Vector2:
	return (
		Input.get_vector("Left", "Right", "Up", "Down")
	)
