extends Entity
class_name Player

@export_category("Dash Stuff")
@export var dash_speed : float = 700.0
@export var dash_duration : float = 0.3

@onready var hurtbox: CollisionShape2D = %hurtbox
@onready var hurtbox_component: HurtboxComponent = %HurtboxComponent
@onready var state_machine: StateMachine = %StateMachine
@onready var health_component: HealthComponent = %HealthComponent

var last_wasd_input : Vector2
var iframes : float
var dead : bool = false:
	set(value):
		dead = value
		if dead:
			state_machine.change_state("Dead")
var damage_mult : float = 1.0

const coin_res : SuckableItemResource = preload("res://SuckableItems/SuckableItemResources/coin.tres")

func _ready() -> void:
	Global.player = self
	hurtbox_component.Hurt.connect(
		func(attack: Attack):
			iframes = 1
	)
	
	Global.current_game_state = Global.game_states.COMBAT
	Global.coins = 0
	Global.current_wave = 1

func _physics_process(delta: float) -> void:
	if dead:
		iframes = 1
	else:
		iframes = max(iframes - delta, 0)
	hurtbox.disabled = iframes > 0
	
	move_and_slide()
	
	if get_wasd_input() != Vector2.ZERO:
		last_wasd_input = get_wasd_input()

func get_wasd_input() -> Vector2:
	return (
		Input.get_vector("Left", "Right", "Up", "Down")
	)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("LoadCoin"):
		if Global.coins >= 1:
			Global.barrel.add_item(coin_res)
			Global.coins -= 1
