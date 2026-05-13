extends Resource
class_name SuckableItemResource

@export var item_name : String
@export var texture : Texture
@export var color : Color
@export var item_size : float = 1 ## Scale for the X and Y, applies to the suckable & the projectile

@export_category("Projectile Stats")
@export var damage : float = 10
@export var speed : float = 700
@export var knockback : float = 500
@export var stun_duration : float = 0.3
@export var spread : float = 0
@export var hits : int = 1 ## How many times it can pierce / bounce
## True = Bounce, False = Pierce
@export var bounce : bool = false
@export var projectile_amnt : int = 1

@export_category("Sound Effects")
@export var sfx : AudioStream ## Sound effect that plays when you shoot this item
@export var sfx_volume : float = 0.0
@export var sfx_pitch : float = 1.0
@export var sfx_start : float = 0.0

@export_category("On Hit Effects")
## Scene that gets instantiated when the projectile hits
## e.g. explosion
@export var on_hit_scn : PackedScene
