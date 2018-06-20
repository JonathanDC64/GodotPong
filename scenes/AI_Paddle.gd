extends KinematicBody2D

export(float) var speed

var ball

func _ready():
	pass


func set_ball(ball):
	self.ball = ball
	
func _process(delta):
	var velocity = Vector2()
	var ball_position = ball.position
	
	print(ball_position)
	
	if ball_position.y > position.y:
		velocity.y = 1
	elif ball_position.y < position.y:
		velocity.y = -1
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)