extends Control

var health_segments = 1 : set = set_health_segments
var max_health_segments = 25 : set = set_max_health_segments

@onready var healthEmpty = $CanvasLayer/HealthEmpty
@onready var healthFull = $CanvasLayer/HealthFull

func _ready():
	self.max_health_segments = PlayerStats.max_health
	self.health_segments = PlayerStats.health
	PlayerStats.connect("health_changed",Callable(self,"set_health_segments"))
	PlayerStats.connect("max_health_changed",Callable(self,"set_max_health_segments"))
	
func set_health_segments(value):
	health_segments = clamp(value, 0,  max_health_segments)
	if healthFull != null:
		healthFull.size.x = PlayerStats.health * 2
		
	
func set_max_health_segments(_value):
	max_health_segments = PlayerStats.max_health * 2
	
	
func _physics_process(_delta: float) -> void:
	set_health_segments(PlayerStats.health)
	
	

