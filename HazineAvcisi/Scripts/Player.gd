extends KinematicBody2D

const HIZ = 200

const JUMP_POWER = 700
const GRAVITY = 40
var hizVektoru : Vector2

var keySayisi = 0
func _ready():
	hizVektoru = Vector2(0, 0) 
	
	$AnimatedSprite.play("stand")
	$UI/GameOver.hide()
	$UI/Finished.hide()
	
	
	get_tree().paused = false
	
	pass


func _physics_process(delta):
	
	
	if position.y > 1400:
		gameOver()
		
		
		get_tree().paused = true
		pass
	
	$Skorumuz.text = str(Global.playerData.skor);
	
	hizVektoru.x = 0

	
	if is_on_floor():
		hizVektoru.y = 0
		
		if not Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
			$AnimatedSprite.play("stand")
			pass
		pass
	else:
		
		hizVektoru.y += GRAVITY
#		
		$AnimatedSprite.play("jump")
		pass
	
	if Input.is_action_pressed("move_right"):
		hizVektoru.x = HIZ
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
		pass
	
	if Input.is_action_pressed("move_left"):
		hizVektoru.x = -HIZ
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
		pass
		
	if is_on_floor() and Input.is_action_pressed("jump"):
		hizVektoru.y = -JUMP_POWER
		$AnimatedSprite.play("jump")
		pass
	

	move_and_slide(hizVektoru, Vector2(0, -1))
	pass
		

func _process(delta):
	pass

func _on_btn_restart_pressed():
	Global.playerData.skor = 0  
	get_tree().reload_current_scene()  
	pass

func _on_btn_goToMenu_pressed():
	get_tree().change_scene("res://Sahneler/AnaMenu.tscn")
	Global.playerData.skor = 0  
	pass
	
func gameOver():
	get_tree().paused = true
	$UI/GameOver.show()
	$UI/GameOver/CenterContainer/Panel/HBoxContainer/VBoxContainer/Label2.text = "Skor " + str(Global.playerData.skor)
	pass
	
func levelBasariylaTamamlandi():
	
	yield(get_tree().create_timer(1), "timeout")
	
	
	$UI/Finished/CenterContainer/Panel/HBoxContainer/VBoxContainer/Label2.text = "Skor " + str(Global.playerData.skor)
	
	
	get_tree().paused = true
	$UI/Finished.show()
	pass
func _on_btn_next_level_pressed():
	
	var current_scene = get_tree().current_scene.filename

	
	if current_scene == "res://Sahneler/Level2.tscn":
		get_tree().change_scene("res://Sahneler/Level3.tscn")
	else:
		get_tree().change_scene("res://Sahneler/Level2.tscn")

	
	Global.playerData.skor = 0  
	pass 
