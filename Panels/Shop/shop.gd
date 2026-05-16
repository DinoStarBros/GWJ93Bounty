extends Control
class_name Shop

@onready var next_wave_button: Button = %next_wave_button
@onready var coin_count: Label = %coin_count
@onready var upgrades: GridContainer = %upgrades
@onready var restock: Button = %Restock

var upgrade_buy_buttons : Array[UpgradeBuyButton]
var shuffled_upgrade_resources : Array[UpgradeResource]
var possible_upgrade_resources : Array[UpgradeResource] = [
	preload("res://UpgradeResources/max_hp_upg.tres"),
	preload("res://UpgradeResources/dmg_upg.tres"),
	preload("res://UpgradeResources/projectile_spd_upg.tres"),
	preload("res://UpgradeResources/projectile_size_upg.tres"),
	preload("res://UpgradeResources/suck_range_upg.tres"),
	preload("res://UpgradeResources/move_spd_upg.tres"),
	preload("res://UpgradeResources/dash_spd_upg.tres"),
	preload("res://UpgradeResources/barrel_capacity_upg.tres"),
	
]

func _ready() -> void:
	Global.crates_for_next_wave = 0
	
	next_wave_button.pressed.connect(_next_wave_pressed)
	GlobalSignals.NextWaveStart.connect(_next_wave_start)
	%buy_barrel.pressed.connect(_buy_crate_pressed)
	restock.pressed.connect(_restock_pressed)
	
	for node in upgrades.get_children():
		if node is UpgradeBuyButton:
			upgrade_buy_buttons.append(node)
	
	shuffled_upgrade_resources = possible_upgrade_resources
	setup_upgrade_buy_buttons()

func setup_upgrade_buy_buttons() -> void:
	shuffled_upgrade_resources.shuffle()
	
	var ndex : int = -1
	for ubb in upgrade_buy_buttons: if ubb is UpgradeBuyButton:
		ndex += 1
		ubb.upgrade_resource = shuffled_upgrade_resources[ndex]

func _next_wave_pressed() -> void:
	GlobalSignals.NextWaveStart.emit()

func _next_wave_start() -> void:
	Global.current_wave += 1
	Global.crate_price += 1
	get_tree().paused = false
	Global.current_game_state = Global.game_states.COMBAT
	queue_free()

func _restock_pressed() -> void:
	if Global.coins >= Global.restock_price:
		for ubb in upgrade_buy_buttons: if ubb is UpgradeBuyButton:
			ubb.bought = false
		setup_upgrade_buy_buttons()
		Global.coins -= Global.restock_price
		
		%restock.pitch_scale = 1 + randf_range(-.1, .1)
		%restock.play()
		
		Global.restock_price += 1

func _buy_crate_pressed() -> void:
	if Global.coins >= Global.crate_price:
		%chaChing.pitch_scale = 1.4 + randf_range(-.1,.1)
		%chaChing.play()
		
		Global.coins -= Global.crate_price
		Global.crates_for_next_wave += 1

func _process(delta: float) -> void:
	
	coin_count.text = str(
		"Coins: ", Global.coins
	)
	
	next_wave_button.text = str(
		"Next Wave (Wave ", Global.current_wave+1, ")"
	)
	
	restock.text = str(
		"Restock (", Global.restock_price, ")"
	)
	
	%crate_price.text = str(
		"Cost: ", Global.crate_price,
		"\n",
		"Crates Bought for Next Wave: ",
		Global.crates_for_next_wave
		
	)
