extends Node2D
class_name Blunderbuss

@onready var sprite: Sprite2D = %PeaGun
@onready var suck_effect: SuckEffect = %SuckEffect
@onready var vac_loop: AudioStreamPlayer = %vacLoop

var vacloop_desire_pitch : float = 0.01
var vacloop_desire_vol : float = -80
var sucking : bool = false:
	set(value):
		if sucking == value: return
		sucking = value
		if sucking:
			vacloop_desire_pitch = 5
			vacloop_desire_vol = -10
		else:
			vacloop_desire_pitch = 0.01
			vacloop_desire_vol = -80

func _input(event: InputEvent) -> void:
	sucking = Input.is_action_pressed("Suck")

func _physics_process(delta: float) -> void:
	suck_effect.enable = sucking
	
	vac_loop.pitch_scale = lerp(vac_loop.pitch_scale, vacloop_desire_pitch, 6.0 * delta)
	#vac_loop.volume_db = lerp(vac_loop.volume_db, vacloop_desire_vol, 3.0 * delta)
