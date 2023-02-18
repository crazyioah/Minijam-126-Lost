extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite
var velocity = Vector2()
export (int) var speed = 200

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		animated_sprite.play("walk")
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		animated_sprite.play("walk")
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		animated_sprite.play("walk")
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		animated_sprite.play("walk")
	else: 
		animated_sprite.stop()
	velocity  = velocity.normalized() * speed
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
