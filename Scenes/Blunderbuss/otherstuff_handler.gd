extends Node
class_name VacloopHandler

@export var blunderbuss : Blunderbuss

@onready var vac_loop: AudioStreamPlayer = %vacLoop
@onready var suck_effect: SuckEffect = %SuckEffect
@onready var suck_collision: CollisionPolygon2D = %suckCollision
@onready var suck_pickup_collision: CollisionShape2D = %suckPickupCollision
@onready var hitbox_component: HitboxComponent = %HitboxComponent

var melee_damage : float = 5

func _ready() -> void:
	suck_range_handle()
	
	await get_tree().process_frame
	hitbox_component.attack.attack_damage = melee_damage * Global.player.damage_mult
	hitbox_component.attack.knockback = 500
	hitbox_component.attack.stun_duration = .4

func suck_range_handle() -> void:
	suck_collision.polygon[1].x = blunderbuss.suck_range
	suck_collision.polygon[2].x = blunderbuss.suck_range

	suck_collision.polygon[1].y = -blunderbuss.suck_spread
	suck_collision.polygon[2].y = blunderbuss.suck_spread
	
	suck_effect.suck_range = blunderbuss.suck_range
	suck_effect.suck_spread = blunderbuss.suck_spread

func _physics_process(delta: float) -> void:
	vacloop_sfx_handle(delta)
	suck_effect_and_colliders_handle()

func vacloop_sfx_handle(delta: float) -> void:
	vac_loop.pitch_scale = lerp(vac_loop.pitch_scale, blunderbuss.vacloop_desire_pitch, 6.0 * delta)
	vac_loop.playing = vac_loop.pitch_scale >= 0.5

func suck_effect_and_colliders_handle() -> void:
	suck_effect.enable = blunderbuss.sucking
	
	suck_collision.disabled = !blunderbuss.sucking
	suck_pickup_collision.disabled = !blunderbuss.sucking

func play_shoot_sfx() -> void:
	%shoot.pitch_scale = 1 + randf_range(-.1,.1)
	%shoot.play(0.08)
	
	%shoot2.pitch_scale = 2 + randf_range(-.1,.1)
	%shoot2.play()
