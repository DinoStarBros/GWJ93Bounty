extends Node2D
## suckable items
class_name SuckableItem

@export var item_resource : SuckableItemResource

@onready var sprite: Sprite2D = %Sprite

var is_go_to_suck : bool = false
var velocity : Vector2
var dir_to_blunderbuss_gun_tip : Vector2
var trig_time : float = 0

const move_speed : float = 700
const trig_speed : float = 3

func _ready() -> void:
	sprite.texture = item_resource.texture
	%SuckDetectArea.area_entered.connect(_suck_area_entered)
	%SuckDetectArea.area_exited.connect(_suck_area_exited)
	%SuckPickupArea.area_entered.connect(_suck_pickup_area_entered)
	sprite.self_modulate = item_resource.color
	scale.x = item_resource.item_size
	scale.y = item_resource.item_size

func _suck_area_entered(area:Area2D) -> void:
	is_go_to_suck = true

func _suck_area_exited(area:Area2D) -> void:
	is_go_to_suck = false

func _suck_pickup_area_entered(area:Area2D) -> void:
	Global.barrel.add_item(item_resource)
	queue_free()

func _physics_process(delta: float) -> void:
	trig_time = wrapf(trig_time + (delta * trig_speed), 0, 2 * PI)
	_move(delta)
	dir_to_blunderbuss_gun_tip = global_position.direction_to(Global.blunderbuss_gun_tip.global_position)
	if is_go_to_suck:
		velocity = dir_to_blunderbuss_gun_tip * move_speed
	else:
		velocity = Vector2.ZERO
	
	sprite.position.y = sin(trig_time) * 3

func _move(delta: float) -> void:
	global_position += delta * velocity
