extends Area

var resources = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Stone_body_entered(body):
	resources -= 1
	print("There are ", resources, " resourses left in the Stone area.")
	if resources <= 0:
		queue_free()
