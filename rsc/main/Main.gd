extends Node

func _on_MoreJumpForce_pressed():
	g.jump_force -= 100
	$StaticBody2D/VBoxContainer/JumpForce.text = "Jump force: " + str(-g.jump_force)

func _on_MinusJumpForce_pressed():
	g.jump_force += 100
	$StaticBody2D/VBoxContainer/JumpForce.text = "Jump force: " + str(-g.jump_force)

func _on_MoreJumps_pressed():
	g.jump_count_avaliable += 1
	$StaticBody2D/VBoxContainer/Jumps.text = "Jumps: " + str(g.jump_count_avaliable)

func _on_MinusJumps_pressed():
	g.jump_count_avaliable -= 1
	$StaticBody2D/VBoxContainer/Jumps.text = "Jumps: " + str(g.jump_count_avaliable)
