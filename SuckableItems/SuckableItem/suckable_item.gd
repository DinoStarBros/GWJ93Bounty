extends Node2D
## suckable items
class_name SuckableItem

@export var item_resource : SuckableItemResource

@onready var sprite: Sprite2D = %Sprite

var is_go_to_suck : bool = false
var velocity : Vector2
var dir_to_blunderbuss_gun_tip : Vector2

const move_speed : float = 500

func _ready() -> void:
	sprite.texture = item_resource.texture
	%SuckDetectArea.area_entered.connect(_suck_area_entered)
	%SuckDetectArea.area_exited.connect(_suck_area_exited)

func _suck_area_entered(area:Area2D) -> void:
	is_go_to_suck = true

func _suck_area_exited(area:Area2D) -> void:
	is_go_to_suck = false

func _physics_process(delta: float) -> void:
	_move(delta)
	dir_to_blunderbuss_gun_tip = global_position.direction_to(Global.blunderbuss_gun_tip.global_position)
	if is_go_to_suck:
		velocity = dir_to_blunderbuss_gun_tip * move_speed
	else:
		velocity = Vector2.ZERO

func _move(delta: float) -> void:
	global_position += delta * velocity
