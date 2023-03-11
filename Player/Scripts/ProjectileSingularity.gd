extends Node2D
const projectile = preload("res://Player/Scenes/Projectile.tscn")

@onready var player = PlayerStats
var projectiles = 0
@onready var timer = $ProjectileTimer

func _ready() -> void:
	pass
	
func _physics_process(_delta):
	#Movement
	if Input.get_action_strength("ui_left_click") and PlayerStats.magic > 0 and $ProjectileTimer.time_left == 0 and PlayerStats.magic >= 1:
		var GrabedInstance = projectile.instantiate()
		self.add_child(GrabedInstance)
		add_to_group("Projectiles")
		timer.start()
		PlayerStats.magic -= 1
		$MagicRenewTimer.start()
		
	if PlayerStats.magic < 5 and $MagicRenewTimer.time_left == 0:
		PlayerStats.magic += 0.5
		$MagicRenewTimer.start()
