extends KinematicBody2D

var velocity = Vector2(0,0)
const speed = 400 

func _ready():
	OS.center_window() 
	
func _physics_process(_delta):
	# if some vars woul be negative, we will restart the game
	# and put the values again (these vars can not be negative)
	if g.jump_force >= 0:
		get_tree().reload_current_scene() # restart
		g.jump_force = -700 # put the value again
	if g.jump_count_avaliable <= 0:
		get_tree().reload_current_scene() # restart
		g.jump_count_avaliable = 2 # put the value again 
	
	# if steve is on floor
	if is_on_floor():
		g.jump_count = 0 # restart the jump count
		g.can_jump = true # it will be able to jump again
	
	# if the jump count reachs the limit
	if g.jump_count == g.jump_count_avaliable: 
		g.can_jump = false # it will not be able to jump again
		
	# if can jump
	if g.can_jump == true:
		if Input.is_action_just_pressed("jump"):
			velocity.y = g.jump_force
			g.jump_count += 1 # all times we jump, increase the count
			
	# if it falls
	if global_position.y > 700:
		get_tree().reload_current_scene() # restart
			
	# movement and anims
	if Input.is_action_pressed("right"):
		velocity.x = speed
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
		
	if not is_on_floor():
		$Sprite.play("air")
	
	# reset
	if Input.is_key_pressed(KEY_R):
		g.jump_force = -700
		g.jump_count_avaliable = 2
		get_tree().reload_current_scene()
		
	velocity.y = velocity.y + 30 
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.2)
	
	
