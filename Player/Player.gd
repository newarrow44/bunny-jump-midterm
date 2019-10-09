extends KinematicBody2D

var motion = Vector2(0,100)
export var gravity = 30
export var SPEED = 300
export var jump = 700
var jump_count = 1

func _physics_process(delta):
	
	move_and_slide(motion, Vector2(0, -1 ))
	
	apply_gravity()
	walk()
	jump()
	update_animation()
	
func is_dead():
	if position.y > 2000:
		return true
	return false
	
	
func update_animation():
		if motion.y < 0:
			$AnimatedSprite.play("jump")
		elif motion.x >0:
			$AnimatedSprite.play("walk")
			$AnimatedSprite.flip_h = false
		elif motion.x <0:
			$AnimatedSprite.play("walk")
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.play("idle")
	
	
func apply_gravity():
	if is_on_floor():
		motion.y = 0
		
	else:
		motion.y = motion.y + gravity
	
func jump():
	if jump_count < 2:
		if Input.is_action_just_pressed("jump"):
			motion.y = -jump
			jump_count = jump_count + 1
			$AudioStreamPlayer.play()
	if is_on_floor():
		jump_count = 0

	
func walk():
	if Input.is_action_pressed("left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right"):
		motion.x = +SPEED
	else:
		motion.x = 0