extends Node2D
class_name HealthComponent

@export var hp_bar : ProgressBar
@export var hp_text : Label
@export var allow_multihit : bool = false
@export var p : Entity

var max_hp : float = 50
var hp : float = max_hp:
	set(value):
		hp = value
		if hp_bar:
			hp_bar.max_value = max_hp
			hp_bar.value = hp
		if hp_text:
			hp_text.text = str(
				roundi(hp), " / ", roundi(max_hp)
			)

func _ready() -> void:
	max_hp = p.max_hp
	hp = max_hp
	
	GlobalSignals.WaveDone.connect(wave_done)

func hurt(attack:Attack) -> void:
	hp -= attack.attack_damage
	if get_parent() is Enemy:
		if hp <= 0:
			get_parent().queue_free()
	elif get_parent() is Player:
		if hp <= 0:
			pass

func wave_done() -> void:
	if get_parent() is Player:
		get_parent().global_position = Vector2.ZERO
