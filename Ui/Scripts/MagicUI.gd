extends Control

var magic_segments = 1 : set = set_magic_segments
var max_magic_segments = 25 : set = set_max_magic_segments

@onready var magicEmpty = $CanvasLayer/MagicEmpty
@onready var magicFull = $CanvasLayer/MagicFull

func _ready():
	self.max_magic_segments = PlayerStats.max_magic
	self.magic_segments = PlayerStats.magic
	PlayerStats.connect("max_magic_changed",Callable(self,"set_max_health_segments"))
	PlayerStats.connect("magic_changed",Callable(self,"set_magic_segments"))
	
func set_magic_segments(value):
	magic_segments = clamp(value, 0,  max_magic_segments)
	if magicFull != null:
		magicFull.size.x = PlayerStats.magic * 10
		
	
func set_max_magic_segments(_value):
	max_magic_segments = PlayerStats.max_magic * 10
	
	
func _physics_process(_delta: float) -> void:
	set_magic_segments(PlayerStats.magic)

