extends Node2D
class_name Barrel

signal Shoot(item: SuckableItemResource)
signal Eject(item: SuckableItemResource)

@onready var bar_item_spawn: Node2D = %BarItemSpawn
@onready var debug: Label = %debug

var items : Array[SuckableItemResource]
var barrel_items : Array[BarrelItem]
var barrel_item_names : Array
var max_item_amount : int = 7

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
	
	barrel_item.global_position = bar_item_spawn.global_position
	barrel_items.append(barrel_item)
	barrel_item_names.append(barrel_item.item_resource.item_name)

func _process(delta: float) -> void:
	debug.text = str(barrel_item_names)
	
	if barrel_items.size() > max_item_amount:
		eject()
	if Input.is_action_just_pressed("Shoot"):
		shoot()
	if Input.is_action_just_pressed("Eject"):
		eject()

## This function ejects the bottom most item of the barrel,
## shooting it backwards
func eject() -> void:
	if barrel_items.size() >= 1:
		Eject.emit(barrel_items[0].item_resource)
		
		barrel_items[0].queue_free()
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
		
		shot_item.queue_free()
		barrel_items.remove_at(barrel_items.size()-1)
		barrel_item_names.remove_at(barrel_items.size()-1)
	else:
		empty()

func empty() -> void:
	%Empty.pitch_scale = 1 + randf_range(-.1,.1)
	%Empty.play(.06)
