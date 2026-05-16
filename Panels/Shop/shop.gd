extends Control
class_name Shop

@onready var next_wave_button: Button = %next_wave_button
@onready var coin_count: Label = %coin_count

func _ready() -> void:
	next_wave_button.pressed.connect(_next_wave_pressed)
	GlobalSignals.NextWaveStart.connect(_next_wave_start)

func _next_wave_pressed() -> void:
	GlobalSignals.NextWaveStart.emit()

func _next_wave_start() -> void:
	get_tree().paused = false
	Global.current_game_state = Global.game_states.COMBAT
	queue_free()

func _process(delta: float) -> void:
	coin_count.text = str(
		"Coins: ", Global.coins
	)
