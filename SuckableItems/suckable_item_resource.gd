extends Resource
class_name SuckableItemResource

@export var item_name : String
@export var texture : Texture
@export var color : Color
@export var item_scale : Vector2 = Vector2.ONE

@export_category("Projectile Stats")
@export var damage : float = 10
@export var speed : float = 700
@export var knockback : float = 500
@export var pierce : int = 1
@export var stun_duration : float = 0.3
@export var spread : float = 0.0
@export var projectile_amnt : int = 1
