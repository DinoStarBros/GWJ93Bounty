extends Control
class_name Shop

@onready var next_wave_button: Button = %next_wave_button
@onready var coin_count: Label = %coin_count
@onready var upgrades: GridContainer = %upgrades

var upgrade_buy_buttons : Array[UpgradeBuyButton]

const upgrade_resources : Array[UpgradeResource] = [
	preload("res://UpgradeResources/max_hp_upg.tres"),
	
]

func _ready() -> void:
	next_wave_button.pressed.connect(_next_wave_pressed)
	GlobalSignals.NextWaveStart.connect(_next_wave_start)
	%buy_barrel.pressed.connect(
		func():
		pass
	)
	
	for node in upgrades.get_children():
		if node is UpgradeBuyButton:
			upgrade_buy_buttons.append(node)
	
	setup_upgrade_buy_buttons()

func setup_upgrade_buy_buttons() -> void:
	pass

func _next_wave_pressed() -> void:
	GlobalSignals.NextWaveStart.emit()

func _next_wave_start() -> void:
	Global.current_wave += 1
	get_tree().paused = false
	Global.current_game_state = Global.game_states.COMBAT
	queue_free()

func _process(delta: float) -> void:
	coin_count.text = str(
		"Coins: ", Global.coins
	)
	
	next_wave_button.text = str(
		"Next Wave (Wave ", Global.current_wave+1, ")"
	)
