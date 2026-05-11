extends Node2D
class_name Blunderbuss

@onready var sprite: Sprite2D = %PeaGun
@onready var suck_effect: SuckEffect = %SuckEffect
@onready var vac_loop: AudioStreamPlayer = %vacLoop
@onready var suck_collision: CollisionPolygon2D = %suckCollision
@onready var gun_tip: Marker2D = %GunTip

var vacloop_desire_pitch : float = 0.01
var sucking : bool = false:
	set(value):
		if sucking == value: return
		sucking = value
		if sucking:
			vacloop_desire_pitch = 5
		else:
			vacloop_desire_pitch = 0.01

func _ready() -> void:
	Global.blunderbuss = self
	Global.blunderbuss_gun_tip = gun_tip

func _input(event: InputEvent) -> void:
	sucking = Input.is_action_pressed("Suck")

func _physics_process(delta: float) -> void:
	suck_effect.enable = sucking
	
	vac_loop.pitch_scale = lerp(vac_loop.pitch_scale, vacloop_desire_pitch, 6.0 * delta)
	suck_collision.disabled = !sucking
