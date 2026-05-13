extends CanvasLayer
class_name DevOps

@export var p : Player

var ip : ItemsParent
var ep : EntitiesParent

func _ready() -> void:
	await get_tree().process_frame
	ip = Global.items_parent
	ep = Global.entities_parent
	
	for n in spawn_buttons.values(): if n[0] is Button:
		n[0].pressed.connect(n[1])
	
	visible = OS.is_debug_build()

func _process(delta: float) -> void:
	if !OS.is_debug_build(): return
	if Input.is_action_just_pressed("Devops"):
		visible = !visible

@onready var spawn_buttons : Dictionary = {
	1:[%sCoin,
		func(): ip.spawn_coin(p.global_position)
	],
	2:[%sGrapeshot,
		func(): ip.spawn_grapeshot(p.global_position)
	],
	3:[%sDummy,
		func(): ep.spawn_dummy(p.global_position)
	],
	4:[%sHeavyBall,
		func(): ip.spawn_heavyball(p.global_position)
	],
	5:[%sNail,
		func(): ip.spawn_nail(p.global_position)
	],
	6:[%sBuckshot,
		func(): ip.spawn_buckshot(p.global_position)
	],
	7:[%sRubberBall,
		func(): ip.spawn_rubberball(p.global_position)
	],
	8:[%sBomb,
		func(): ip.spawn_bomb(p.global_position)
	],
	9:[%sCigar,
		func(): ip.spawn_cigar(p.global_position)
	],
	10:[%sBolas,
		func(): ip.spawn_bolas(p.global_position)
	],
}
