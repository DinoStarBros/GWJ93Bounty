extends Node

enum game_states {
	COMBAT, LOSE, WIN, TITLE, SHOP
	
}

var current_game_state : game_states
var projectiles_parent : ProjectilesParent
var player : Player
var blunderbuss : Blunderbuss
var blunderbuss_gun_tip : Marker2D
var barrel : Barrel
var entities_parent : EntitiesParent
var camera : Camera
var items_parent : ItemsParent
var shop_parent : ShopParent
var enable_devops : bool = false
var coins : int
var current_wave : int

const txt_scn : PackedScene = preload("res://Juices/DmgNum/dmg_num.tscn")

func _process(_delta:float)->void:
	volume_handle()

func frame_freeze(timescale: float, duration: float) -> void: ## Slows down the engine's time scale, slowing down the time, for a certain duration. Use for da juice
	if SaveLoad.settings.frame_freeze_value:
		Engine.time_scale = timescale
		await get_tree().create_timer(duration, true, false, true).timeout
		Engine.time_scale = 1.0

func volume_handle() -> void:
	AudioServer.set_bus_volume_db(
		0,
		linear_to_db(SaveLoad.settings.master_volume)
	)
	AudioServer.set_bus_volume_db(
		1,
		linear_to_db(SaveLoad.settings.music_volume)
	)
	AudioServer.set_bus_volume_db(
		2,
		linear_to_db(SaveLoad.settings.sfx_volume)
	)

func spawn_txt(text: Variant, global_pos: Vector2)->void: ## Spawns a splash text effect, can be used for damage numbers, or score
	var txt : DmgNum = txt_scn.instantiate()
	txt.text = str(text)
	txt.global_position = global_pos
	projectiles_parent.add_child(txt)
