extends Node

var fsm: StateMachine
onready var agent = $"../../"

var speed = 10
var continue_state
var rng = RandomNumberGenerator.new()
var randx
var	randz
var pozx = 0.1
var pozz = 0.1

func enter():
	print("Hello from State Wonder!")
	pozx = 0.1
	pozz = 0.1
	rng.randomize()
	randx = rng.randi_range(-10, 10)
	randz = rng.randi_range(-10, 10)
	continue_state = false
	while !continue_state:
		yield(get_tree().create_timer(0.1), "timeout")
	exit()

func exit():
	fsm.back()

func process(delta):
	# Rotate the transform about the X axis
	#agent.global_transform.origin += Vector3(pozx, 0, pozz)
	#move_and_collide(Vector3(self.global_transform.origin.x + 0.1, self.global_transform.origin.y, self.global_transform.origin.z+0.1))
	
	
	if abs(agent.global_transform.origin.x - randx) > 0.1 || abs(agent.global_transform.origin.z - randz) > 0.1:
		agent.global_transform.origin = agent.global_transform.origin.move_toward(Vector3(randx, agent.global_transform.origin.y, randz), delta * speed)
	else:
		continue_state = true
	# Add handler code here
	return delta
	



func _on_Area_body_entered(body):
	print("M-am lovit de a1")
	pozx = -pozx
	#pozz = -pozz


func _on_Area2_body_entered(body):
	print("M-am lovit de a2")
	pozx = -pozx
	#pozz = -pozz


func _on_Area3_body_entered(body):
	print("M-am lovit de a3")
	#pozx = -pozx
	pozz = -pozz


func _on_Area4_body_entered(body):
	print("M-am lovit de a4")
	#pozx = -pozx
	pozz = -pozz


func _on_Sand_body_entered(body):
	pass # Replace with function body.
