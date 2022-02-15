extends Area2D

export (int) var speed
var direction = "South"

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Global.player1.direction_facing
	
	if direction == "East":
		rotation_degrees = 0
	if direction == "West":
		rotation_degrees = 180
	if direction == "North":
		rotation_degrees = -90
	if direction == "South":
		rotation_degrees = 90
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction == "East":
		position += Vector2(1,0) * speed * delta
	if direction == "West":
		position += Vector2(-1,0) * speed * delta
	if direction == "North":
		position += Vector2(0,-1) * speed * delta
	if direction == "South":
		position += Vector2(0,1) * speed * delta
