extends RigidBody2D

export(float) var speed

func _ready():
	pass

func set_velocity(velocity):
	linear_velocity = velocity.normalized() * speed

func _process(delta):
	print(linear_velocity)
	pass
