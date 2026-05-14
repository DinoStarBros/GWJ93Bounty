extends Node2D
class_name Barrel

signal Shoot(item: SuckableItemResource)
signal Eject(item: SuckableItemResource)

@onready var debug: Label = %debug

var items : Array[SuckableItemResource]
var barrel_items : Array[BarrelItem]
var barrel_item_names : Array
var max_item_amount : int = 15
var barrel_items_amount : int:
	set(value):
		if barrel_items_amount == value: return
		barrel_items_amount = value
		update_barrel_items_positions()

const barrel_item_scn : PackedScene = preload("res://SuckableItems/BarrelItem/barrel_item.tscn")

func _ready() -> void:
	Global.barrel = self

func add_item(item: SuckableItemResource) -> void:
	_spawn_barrel_item(item)
	items.append(item)
	%Pop.pitch_scale = 1 + randf_range(-.3,.3)
	%Pop.play(.13)

func _spawn_barrel_item(item_res: SuckableItemResource) -> void:
	var barrel_item : BarrelItem = barrel_item_scn.instantiate()
	barrel_item.item_resource = item_res
	add_child(barrel_item)
	
	#barrel_item.global_position = bar_item_spawn.global_position
	barrel_items.append(barrel_item)
	barrel_item_names.append(barrel_item.item_resource.item_name)

func _process(delta: float) -> void:
	debug.text = str(barrel_item_names)
	barrel_items_amount = barrel_items.size()
	
	if barrel_items_amount > max_item_amount:
		eject()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Shoot"):
		shoot()
	if Input.is_action_just_pressed("Eject"):
		eject()

func update_barrel_items_positions() -> void:
	var ndex : int = -1
	for bi in barrel_items: if bi is BarrelItem:
		ndex += 1
		var mindex : int = min(ndex, max_item_amount-1)
		var pos_y : float = 104 - (64 * mindex)
		barrel_items[mindex].position.y = pos_y
		#tween_vec2(
			#barrel_items[mindex],
			#"position",
			#Vector2(0, pos_y),
			#0.25
			#)

## This function ejects the bottom most item of the barrel,
## shooting it backwards
func eject() -> void:
	if barrel_items.size() >= 1:
		Eject.emit(barrel_items[0].item_resource)
		barrel_items[0].ejected()
		
		#barrel_items[0].queue_free()
		barrel_items.remove_at(0)
		barrel_item_names.remove_at(0)
		
		%Eject.pitch_scale = .7 + randf_range(-.2,.2)
		%Eject.play(.42)
	else:
		empty()

func shoot() -> void:
	if barrel_items.size() >= 1:
		var shot_item : BarrelItem = barrel_items[barrel_items.size()-1]
		Shoot.emit(shot_item.item_resource)
		shot_item.shot()
		
		#shot_item.queue_free()
		barrel_items.remove_at(barrel_items.size()-1)
		barrel_item_names.remove_at(barrel_items.size()-1)
		
	else:
		empty()

func empty() -> void:
	%Empty.pitch_scale = 1 + randf_range(-.1,.1)
	%Empty.play(.06)

var tween : Tween
func tween_vec2(object: Node2D, property: NodePath, vec2: Vector2, duration: float = 0.25) -> void:
	#if tween: tween.kill()
	tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(object, property, vec2, duration)
