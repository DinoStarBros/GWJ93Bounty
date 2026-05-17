extends Entity
class_name Player

@export_category("Dash Stuff")
@export var dash_speed : float = 700.0
@export var dash_duration : float = 0.3

@onready var hurtbox: CollisionShape2D = %hurtbox
@onready var hurtbox_component: HurtboxComponent = %HurtboxComponent
@onready var state_machine: StateMachine = %StateMachine
@onready var health_component: HealthComponent = %HealthComponent
@onready var sprite: Sprite2D = %sprite

var last_wasd_input : Vector2
var iframes : float
var dead : bool = false:
	set(value):
		dead = value
		if dead:
			state_machine.change_state("Dead")
var damage_mult : float = 1.0
var dir_to_mouse : Vector2

const coin_res : SuckableItemResource = preload("res://SuckableItems/SuckableItemResources/coin.tres")

func _ready() -> void:
	Global.player = self
	hurtbox_component.Hurt.connect(
		func(attack: Attack):
			iframes = 1
	)
	GlobalSignals.NextWaveStart.connect(
		func():
		health_component.hp = health_component.max_hp
	)
	
	Global.current_game_state = Global.game_states.COMBAT
	Global.coins = 15
	Global.current_wave = 0
	Global.bounty_score = 0
	
	Global.restock_price = 1
	Global.upgrade_price = 2
	Global.crate_price = 1
	
	GlobalSignals.WaveDone.emit()

func _physics_process(delta: float) -> void:
	if dead:
		iframes = 1
	else:
		iframes = max(iframes - delta, 0)
	hurtbox.disabled = iframes > 0
	
	move_and_slide()
	
	if get_wasd_input() != Vector2.ZERO:
		last_wasd_input = get_wasd_input()
	
	dir_to_mouse = global_position.direction_to(get_global_mouse_position())
	sprite.flip_h = dir_to_mouse.x < 0

func get_wasd_input() -> Vector2:
	return (
		Input.get_vector("Left", "Right", "Up", "Down")
	)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("LoadCoin"):
		if Global.coins >= 1:
			Global.barrel.add_item(coin_res)
			Global.coins -= 1
