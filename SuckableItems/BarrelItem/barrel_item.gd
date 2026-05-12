extends CharacterBody2D
## The visual of the item when it's in the barrel.
class_name BarrelItem

var item_resource : SuckableItemResource

func _ready() -> void:
	velocity.y = 500

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += get_gravity().y * delta * 2
	
	move_and_slide()

func _on_timer_timeout() -> void:
	set_collision_layer_value(7, true)
