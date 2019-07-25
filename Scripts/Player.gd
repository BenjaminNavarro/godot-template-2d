extends KinematicBody2D
class_name Player

export var WALK_FORCE = 1000
export var WALK_MIN_SPEED = 10
export var WALK_MAX_SPEED = 200
export var STOP_FORCE = 200

var walk_left := false
var walk_right := false
var walk_up := false
var walk_down := false
var velocity := Vector2()
var is_colliding := false

onready var _root: Main = get_tree().get_root().get_node("Root")
onready var _fx_player: FXPlayer = _root.get_node("FXPlayer")
var collision_sound = preload("res://Assets/Sound/FX/wall_collision.wav")


func _ready():
	add_to_group("players")

# warning-ignore:unused_argument
func _input(event: InputEvent):
	walk_left = Input.is_action_pressed("ui_left")
	walk_right = Input.is_action_pressed("ui_right")
	walk_up = Input.is_action_pressed("ui_up")
	walk_down = Input.is_action_pressed("ui_down")

func _physics_process(delta: float):
	handle_motion(delta)
	
func handle_motion(delta: float):
	var force = Vector2()	
		
	var stop_left_right = true
	var stop_up_down = true
	
	if walk_left:
		if velocity.x <= WALK_MIN_SPEED and velocity.x > -WALK_MAX_SPEED:
			force.x -= WALK_FORCE
			stop_left_right = false
	elif walk_right:
		if velocity.x >= -WALK_MIN_SPEED and velocity.x < WALK_MAX_SPEED:
			force.x += WALK_FORCE
			stop_left_right = false
		
	if walk_up:
		if velocity.y <= WALK_MIN_SPEED and velocity.y > -WALK_MAX_SPEED:
			force.y -= WALK_FORCE
			stop_up_down = false
	elif walk_down:
		if velocity.y >= -WALK_MIN_SPEED and velocity.y < WALK_MAX_SPEED:
			force.y += WALK_FORCE
			stop_up_down = false

	if stop_left_right:
		var vsign = sign(velocity.x)
		var vlen = abs(velocity.x)
		
		vlen -= STOP_FORCE * delta
		if vlen < 0:
			vlen = 0
		
		velocity.x = vlen * vsign
		
		
	if stop_up_down:
		var vsign = sign(velocity.y)
		var vlen = abs(velocity.y)
		
		vlen -= STOP_FORCE * delta
		if vlen < 0:
			vlen = 0
		
		velocity.y = vlen * vsign
					
	# Integrate forces to velocity
	velocity += force * delta
	velocity = velocity.clamped(WALK_MAX_SPEED)
	# Integrate velocity into motion and move
	# warning-ignore:return_value_discarded 
	velocity = move_and_slide(velocity)
	
	var collisionCounter = get_slide_count()
	if collisionCounter > 0:
		if not is_colliding:
			is_colliding = true
			_fx_player.play_at(collision_sound, position)
	else:
		is_colliding = false