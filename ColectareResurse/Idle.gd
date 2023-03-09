extends Node

var fsm: StateMachine

func enter():
	print("Hello from State Idle!")
	yield(get_tree().create_timer(0.50), "timeout")
	exit()

func exit():
	fsm.back()
