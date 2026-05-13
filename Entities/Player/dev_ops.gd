extends CanvasLayer
class_name DevOps

@export var p : Player

var ip : ItemsParent

func _ready() -> void:
	ip = Global.items_parent
	
	for n in button_and_level.values(): if n[0] is Button:
		n[0].pressed.connect(n[1])

func _process(delta: float) -> void:
	if !OS.is_debug_build(): return
	if Input.is_action_just_pressed("Devops"):
		visible = !visible

@onready var button_and_level : Dictionary = {
	1:[
		%sCoin,
		func(): ip.spawn_coin(p.global_position)
	],
	2:[
		%sGrapeshot,
		func(): ip.spawn_grapeshot(p.global_position)
	],
}
