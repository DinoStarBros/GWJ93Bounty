extends Node2D
## suckable items
class_name SuckableItem

@export var item_resource : SuckableItemResource
@export var debug : Label

@onready var sprite: Sprite2D = %Sprite

var is_go_to_suck : bool = false
var velocity : Vector2
var dir_to_blunderbuss_gun_tip : Vector2
var dir_to_plr : Vector2
var trig_time : float = 0
var is_coin : bool = false

const move_speed : float = 1000
const trig_speed : float = 3

func _ready() -> void:
	sprite.texture = item_resource.texture
	%SuckDetectArea.area_entered.connect(_suck_area_entered)
	%SuckDetectArea.area_exited.connect(_suck_area_exited)
	%SuckPickupArea.area_entered.connect(_suck_pickup_area_entered)
	%CoinPickup.area_entered.connect(_coin_pickup)
	
	sprite.self_modulate = item_resource.color
	scale.x = item_resource.item_size * 1.5
	scale.y = item_resource.item_size * 1.5
	
	debug.text = str(item_resource.item_name)
	#debug.visible = OS.is_debug_build()
	
	is_coin = item_resource.item_name == "Coin"
	%suckPickupCol.disabled = is_coin
	if is_coin:
		sprite.rotation += PI / 2

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
	dir_to_plr = global_position.direction_to(Global.player.global_position + Vector2(0, -32))
	if is_go_to_suck:
		if is_coin:
			velocity = dir_to_plr * move_speed
		else:
			velocity = dir_to_blunderbuss_gun_tip * move_speed
	else:
		velocity = Vector2.ZERO
	
	sprite.position.y = sin(trig_time) * 3

func _move(delta: float) -> void:
	global_position += delta * velocity

func _coin_pickup(area: Area2D) -> void:
	if not is_coin:
		return
	
	if area.get_parent() is Player:
		Global.coins += 1
		SfxManager.play_2d_sfx(SfxManager.sfx_types.CoinPickup, global_position)
		queue_free()
