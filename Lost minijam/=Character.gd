extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite
var velocity = Vector2()
export (int) var speed = 200

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		animated_sprite.play("walk")
		animated_sprite.scale = Vector2(1, 1)
	elif Input.is_action_pressed("move_left"):
		velocity.x -= 1
		animated_sprite.play("walk")
		animated_sprite.scale = Vector2(-1, 1)
	else: 
		animated_sprite.stop()
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	elif Input.is_action_pressed("move_down"):
		velocity.y += 1
	velocity  = velocity.normalized() * speed
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	pass # Replace with function body.
