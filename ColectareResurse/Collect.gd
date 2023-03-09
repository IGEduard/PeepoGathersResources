extends Node

var fsm: StateMachine
onready var agent = $"../../"
var speed = 10
var continue_state
var list = []
var matrix = []
var i = 0
var j = 0
var collect = 2
var stop = 4

func _ready():
	pass
	
func enter():
	print("Hello from State Collect!")
	# Exit 2 seconds later
	continue_state = false
	while !continue_state:
		yield(get_tree().create_timer(0.1), "timeout")
	exit()

func exit():
	fsm.back()

# Optional handler functions for game loop events
func process(delta):
	#if abs(agent.global_transform.origin.x - player.global_transform.origin.x) > 3 || abs(agent.global_transform.origin.z - player.global_transform.origin.z) > 3:
	#	agent.global_transform.origin = agent.global_transform.origin.move_toward(player.global_transform.origin + Vector3(0, 2, 0), delta * speed)
	#else:
	if collect == 0:
		if stop > 0:
			if abs(agent.global_transform.origin.x - matrix[i][j]) > 0 || abs(agent.global_transform.origin.z - matrix[i][j + 1]) > 0:
				agent.global_transform.origin = agent.global_transform.origin.move_toward(Vector3(matrix[i][j], agent.global_transform.origin.y, matrix[i][j + 1]), delta * speed)
			else:
				stop = stop - 1
				print("Matricea dupa ce am mers intr-o zona: ", matrix, i, j, " am ajuns in ", agent.global_transform.origin)
				if i == 1:
					i = 0
				else:
					i = 1
		else:
			collect = 2
			stop = 4
			#print("Matricea inainte de a fi golita este: ", matrix)
			matrix.clear()
	else:
		continue_state = true
	# Add handler code here
	return delta

func physics_process(delta):
	return delta

func input(event):
	return event

func unhandled_input(event):
	return event

func unhandled_key_input(event):
	return event

func notification(what, flag = false):
	return [what, flag]


func _on_Sand_body_entered(body):
	if collect != 0:
		list.insert(list.size(), (body.transform.origin.x))
		list.insert(list.size(), (body.transform.origin.z))
		matrix.append(list)
		matrix = matrix.duplicate(true)
		collect -= 1
		list.clear()
		print("Matricea rezultata este: ", matrix)


func _on_Stone_body_entered(body):
	if collect != 0:
		list.insert(list.size(), (body.transform.origin.x))
		list.insert(list.size(), (body.transform.origin.z))
		matrix.append(list)
		matrix = matrix.duplicate(true)
		collect -= 1
		list.clear()
		print("Matricea rezultata este: ", matrix)



func _on_Water_body_entered(body):
	if collect != 0:
		list.insert(list.size(), (body.transform.origin.x))
		list.insert(list.size(), (body.transform.origin.z))
		matrix.append(list)
		matrix = matrix.duplicate(true)
		collect -= 1
		list.clear()
		print("Matricea rezultata este: ", matrix)


func _on_Lava_body_entered(body):
	if collect != 0:
		list.insert(list.size(), (body.transform.origin.x))
		list.insert(list.size(), (body.transform.origin.z))
		matrix.append(list)
		matrix = matrix.duplicate(true)
		collect -= 1
		list.clear()
		print("Matricea rezultata este: ", matrix)
