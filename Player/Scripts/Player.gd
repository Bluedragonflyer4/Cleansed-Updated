extends CharacterBody2D

const projectile = preload("res://Player/Scenes/Projectile.tscn")
#Movement variables
@export var ACCELERATION = 600
@export var MAX_SPEED = 65
@export var FRICTION = 750

#Stats
var stats = PlayerStats
#Velocity
var Velocity = Vector2.ZERO
var canMove = true

#Animation Variables
@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
@onready var hitBox = $Hitbox/HitboxCollision

func _ready():
	stats.connect("no_health",Callable(self,"queue_free"))
	animationTree.active = true

func _physics_process(delta: float) -> void:
#The attack code is below
	if Input.get_action_strength("ui_right_click"):
		hitBox.set_disabled(false)
		$Hitbox/AttackTimer.start()
		
	if $Hitbox/AttackTimer.is_stopped():
		hitBox.set_disabled(true)
		
#The Code for player look position is below
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
#Animations for movement
	if input_vector != Vector2.ZERO and canMove == true:
		animationTree.set("parameters/Motion/blend_position", input_vector)
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationState.travel("Motion")
		
		Velocity = Velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
	else:
		animationState.travel("Idle")
		Velocity = Velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	# Move and slide
	move()
	
	#Healing
	if Input.get_action_strength("R") and PlayerStats.magic >= 2 and $HealingTimer.is_stopped() and PlayerStats.magic > 0:
		animationTree.active = false
		canMove = false
		PlayerStats.magic -= 2
		animationPlayer.play("Healing")
		$HealingTimer.start()
		$SecondHealingTimer.start()
		
	if $SecondHealingTimer.is_stopped() and animationTree.active == false:
		animationTree.active = true
		canMove = true
		PlayerStats.health = PlayerStats.max_health
		
	
func move():
	set_velocity(Velocity)
	move_and_slide()
	Velocity = Velocity
	
