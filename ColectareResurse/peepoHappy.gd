extends KinematicBody

# How fast the player moves in meters per second.
export var speed = 15
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

var score = 0

var velocity = Vector3.ZERO

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	#self.scale = Vector3(self.scale.x + 0.1, self.scale.y + 0.1, self.scale.z + 0.1)
	#self.global_transform.origin = Vector3(0, 10, 0)
	# We create a local variable to store the input direction.
	var direction = Vector3.ZERO

	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_S):
		direction.z += 1
	if Input.is_key_pressed(KEY_W):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		#$Pivot.look_at(translation + direction, Vector3.UP)

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	#velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)


onready var test = $"../Sand"
onready var text = $"Spatial/Viewport/RichTextLabel"

func _on_Sand_body_entered(body):
	if body.name == "peepoHappy":
		print("Am intrat in zona Sand")
		score += 1
		text.text = "Eduard\n" + "Score: " + str(score)
	
	#body.queue_free()
	#test.queue_free()
	


func _on_Stone_body_entered(body):
	if body.name == "peepoHappy":
		print("Am intrat in zona Stone")
		score += 1
		text.text = "Eduard\n" + "Score: " + str(score)


func _on_Water_body_entered(body):
	if body.name == "peepoHappy":
		print("Am intrat in zona Water")
		score += 1
		text.text = "Eduard\n" + "Score: " + str(score)


func _on_Lava_body_entered(body):
	if body.name == "peepoHappy":
		print("Am intrat in zona Lava")
		score += 1
		text.text = "Eduard\n" + "Score: " + str(score)
