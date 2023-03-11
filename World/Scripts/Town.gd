extends Node2D
const projectile = preload("res://Player/Scenes/Projectile.tscn")

@onready var player = PlayerStats
var projectiles = 0

func _ready() -> void:
	$PauseScreen/ResumeButton.visible = false
	$PauseScreen/Shade.visible = false
	$PauseScreen/ExitButton.visible = false
	$PauseScreen/OptionButton.visible = false

func _physics_process(_delta: float) -> void:
	if Input.get_action_strength("Esc") and $PauseTimer.time_left == 0:
		get_tree().paused = true
		$PauseScreen/ResumeButton.visible = true
		$PauseScreen/Shade.visible = true
		$PauseScreen/ExitButton.visible = true
		$PauseScreen/OptionButton.visible = true
		
		
	
		
func _on_Button_pressed() -> void:
	get_tree().paused = false
	$PauseScreen/ResumeButton.visible = false
	$PauseScreen/Shade.visible = false
	$PauseScreen/ExitButton.visible = false
	$PauseScreen/OptionButton.visible = false


func _on_ExitButton_pressed() -> void:
	get_tree().change_scene_to_file("res://Ui/Scenes/MainMenu.tscn")
	get_tree().paused = false
	


func _on_OptionButton_pressed() -> void:
	$PauseScreen/ResumeButton.visible = false
	$PauseScreen/ExitButton.visible = false
	$PauseScreen/OptionButton.visible = false
