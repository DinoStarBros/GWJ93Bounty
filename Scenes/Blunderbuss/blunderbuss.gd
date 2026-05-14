extends Node2D
class_name Blunderbuss

@export var suck_range : float = 250.0
@export var suck_spread : float = 120.0
@export var barrel : Barrel

@onready var sprite: Sprite2D = %PeaGun
@onready var suck_effect: SuckEffect = %SuckEffect
@onready var suck_collision: CollisionPolygon2D = %suckCollision
@onready var gun_tip: Marker2D = %GunTip
@onready var suck_pickup_collision: CollisionShape2D = %suckPickupCollision
@onready var other_stuff_handler: VacloopHandler = %OtherStuffHandler
@onready var item_sound: AudioStreamPlayer = %ItemSound

var vacloop_desire_pitch : float = 0.01
var sucking : bool = false:
	set(value):
		if sucking == value: return
		sucking = value
		if sucking: vacloop_desire_pitch = 4
		else: vacloop_desire_pitch = 0.01

const projectile_item_scn : PackedScene = preload("res://Projectiles/ProjectileItem/projectile_item.tscn")

func _ready() -> void:
	barrel.Shoot.connect(barrel_shoot)
	barrel.Eject.connect(barrel_eject)
	
	Global.blunderbuss = self
	Global.blunderbuss_gun_tip = gun_tip

func _input(event: InputEvent) -> void:
	sucking = Input.is_action_pressed("Suck")

func barrel_shoot(item: SuckableItemResource) -> void:
	for projectile in item.projectile_amnt:
		_spawn_projectile_item(item, 1)
	
	other_stuff_handler.play_shoot_sfx()
	Global.camera.screen_shake(5, 0.1)

func barrel_eject(item: SuckableItemResource) -> void:
	for projectile in item.projectile_amnt:
		_spawn_projectile_item(item, -1)
	
	Global.camera.screen_shake(2, 0.1)

## Direction = 1, go forward. Direction = -1, go backward
func _spawn_projectile_item(item: SuckableItemResource, direction: int) -> void:
	var projectile_item : ProjectileItem = projectile_item_scn.instantiate()
	var spread : float = item.spread / 10
	
	projectile_item.item_resource = item
	projectile_item.velocity = (
		global_position.direction_to(get_global_mouse_position()) *
		item.speed *
		direction
	)
	Global.projectiles_parent.add_child(projectile_item)
	
	projectile_item.global_position = gun_tip.global_position
	
	projectile_item.velocity.x += randf_range(-spread,spread) * item.speed
	projectile_item.velocity.y += randf_range(-spread,spread) * item.speed
	
	play_item_sfx(item)

func play_item_sfx(item: SuckableItemResource) -> void:
	item_sound.stream = item.sfx
	item_sound.volume_db = item.sfx_volume
	item_sound.pitch_scale = item.sfx_pitch + randf_range(-.2,.2)
	
	item_sound.play(item.sfx_start)
