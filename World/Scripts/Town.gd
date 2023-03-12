extends Node2D
const projectile = preload("res://Player/Scenes/Projectile.tscn")

@onready var player = PlayerStats
var projectiles = 0

func _ready() -> void:
	$PauseScreen.set_visible(false)
	$PauseScreen/ResumeButton.set_visible(false)
	$PauseScreen/Shade.setVisible = false
	$PauseScreen/ExitButton.setVisible = false
	$PauseScreen/OptionButton.setVisible = false

func _physics_process(_delta: float) -> void:
	if Input.get_action_strength("Esc") and $PauseTimer.time_left == 0:
		get_tree().paused = true
		$PauseScreen.setVisible = true
		$PauseScreen/ResumeButton.setVisible = true
		$PauseScreen/Shade.setVisible = true
		$PauseScreen/ExitButton.setVisible = true
		$PauseScreen/OptionButton.setVisible = true
		
		
	
		
func _on_Button_pressed() -> void:
	get_tree().paused = false
	$PauseScreen/ResumeButton.setVisible = false
	$PauseScreen/Shade.setVisible = false
	$PauseScreen/ExitButton.setVisible = false
	$PauseScreen/OptionButton.setVisible = false


func _on_ExitButton_pressed() -> void:
	get_tree().change_scene_to_file("res://Ui/Scenes/MainMenu.tscn")
	get_tree().paused = false
	


func _on_OptionButton_pressed() -> void:
	$PauseScreen/ResumeButton.visible = false
	$PauseScreen/ExitButton.visible = false
	$PauseScreen/OptionButton.visible = false
