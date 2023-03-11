extends Node2D


var mouse
@onready var timer = $Timer


var direction = Vector2(1.0,0.0)
@export var speed = 120

func _ready() -> void:
	$FreeTimer.start()
	mouse = get_local_mouse_position().normalized()

func _physics_process(delta: float) -> void:
	position = position + speed * mouse * delta
	
	
	timer = Timer.new()
	timer.connect("timeout",Callable(self,"_on_timer_timeout"))
	
	add_child(timer)
	timer.start()
	


func _on_timer_timeout():
	queue_free()
	

	
	




func _on_HitBox_body_entered(_body: Node) -> void:
	if $FreeTimer.is_stopped():
		queue_free()
