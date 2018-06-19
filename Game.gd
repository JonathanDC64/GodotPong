extends Node2D

export(PackedScene) var Ball

var viewport
var width
var height 
var spawn

enum LAST_GOAL{
	PLAYER1,
	PLAYER2
}

var last_goal = LAST_GOAL.PLAYER1
var current_ball


func _ready():
	viewport = get_viewport().get_visible_rect()
	width = viewport.size.x
	height = viewport.size.y
	spawn = Vector2(width / 2.0, height / 2.0)	
	spawn_ball()
	
func spawn_ball():
	var ball = Ball.instance()
	add_child(ball)
	ball.position = spawn
	ball.set_name("Ball")
	
	var velocity = Vector2()
	
	randomize()
	
	if last_goal == LAST_GOAL.PLAYER1:
		velocity.x = rand_range(-100, -1)
	else:
		velocity.x = rand_range(1,100)	
	velocity.y = rand_range(-50,50)
	
	ball.set_velocity(velocity)
	
	current_ball = ball
	

func _process(delta):
	if current_ball.position.x < 0:
		remove_child(current_ball)
		last_goal = LAST_GOAL.PLAYER2
		spawn_ball()
	elif current_ball.position.x > viewport.size.x:
		remove_child(current_ball)
		last_goal = LAST_GOAL.PLAYER1
		spawn_ball()
		
	pass
