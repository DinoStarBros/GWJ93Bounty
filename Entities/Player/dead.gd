extends State

func enter() -> void:
	%anims.play("dead")
	
	Global.current_game_state = Global.game_states.LOSE
	await get_tree().create_timer(1).timeout
	SceneManager.change_scene("res://Screens/GameOverScreen/game_over_screen.tscn")

func physics_update(delta: float) -> void:
	p.velocity *= 0.95
