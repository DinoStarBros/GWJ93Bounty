extends CanvasLayer
class_name DevOps

@export var p : Player

var ip : ItemsParent
var ep : EntitiesParent

const espawn_offset : Vector2 = Vector2(100, -100)

func _ready() -> void:
	await get_tree().process_frame
	ip = Global.items_parent
	ep = Global.entities_parent
	
	for n in spawn_buttons.values(): if n[0] is Button:
		n[0].pressed.connect(n[1])
	
	visible = Global.enable_devops

func _process(delta: float) -> void:
	if !Global.enable_devops: return
	if Input.is_action_just_pressed("Devops"):
		visible = !visible

@onready var spawn_buttons : Dictionary = {
	1:[%sCoin,
		func(): ip.spawn_coin(p.global_position)
	],
	2:[%sGrapeshot,
		func(): ip.spawn_grapeshot(p.global_position)
	],
	3:[%sHeavyBall,
		func(): ip.spawn_heavyball(p.global_position)
	],
	4:[%sNail,
		func(): ip.spawn_nail(p.global_position)
	],
	5:[%sBuckshot,
		func(): ip.spawn_buckshot(p.global_position)
	],
	6:[%sRubberBall,
		func(): ip.spawn_rubberball(p.global_position)
	],
	7:[%sBomb,
		func(): ip.spawn_bomb(p.global_position)
	],
	8:[%sCigar,
		func(): ip.spawn_cigar(p.global_position)
	],
	9:[%sBolas,
		func(): ip.spawn_bolas(p.global_position)
	],
	
	# Enemy spawns
	10:[%sDummy,
		func(): ep.spawn_dummy(p.global_position + espawn_offset)
	],
	11:[%sDeckhand,
		func(): ep.spawn_deckhand(p.global_position + espawn_offset)
	],
	12:[%sBuccaneer,
		func(): ep.spawn_buccaneer(p.global_position + espawn_offset)
	],
	13:[%sParrot,
		func(): ep.spawn_parrot(p.global_position + espawn_offset)
	],
	14:[%sCrossbower,
		func(): ep.spawn_crossbower(p.global_position + espawn_offset)
	],
	15:[%sFlamer,
		func(): ep.spawn_flamer(p.global_position + espawn_offset)
	],
}
