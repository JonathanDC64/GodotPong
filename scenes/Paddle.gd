extends Node2D

export(float) var speed

func _ready():
	pass

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("p1_up"):
		velocity.y += -1
	if Input.is_action_pressed("p1_down"):
		velocity.y += 1
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)
