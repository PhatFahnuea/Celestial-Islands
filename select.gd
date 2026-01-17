extends Node3D

var current_selection_character_name
var player_character

# เริ่มต้นแสดงตัวละครทั้งหมด
func _ready() -> void:
	show_all_characters()  
	$startButton.connect("pressed", self._on_character_selection_finished)

func _on_panbutton_pressed() -> void:
	select_character("Panpan")

func _on_cool_button_pressed() -> void:
	select_character("RabbitC")

func _on_bee_button_pressed() -> void:
	select_character("RabbitB")

# ฟังก์ชันเลือกตัวละคร
func select_character(character_name: String) -> void:
	current_selection_character_name = character_name
	$Label.text = current_selection_character_name

	hide_all_characters()  
	$character.get_node(character_name).show()

# ซ่อนตัวละครที่ไม่ได้ถูกเลือก
func hide_all_characters() -> void:
	for character in $character.get_children():
		character.hide()

# แสดงตัวละครทั้งหมดในตอนเริ่ม
func show_all_characters() -> void:
	for character in $character.get_children():
		character.show()

# เมื่อเลือกตัวละครเสร็จ
func _on_character_selection_finished() -> void:
	# เก็บตัวละครที่เลือกเสร็จแล้วไปยังการเล่นเกมหลัก
	$Panbutton.hide()
	$coolButton.hide()
	$beeButton.hide()
	$startButton.hide()
	
	get_tree().change_scene_to_file("res://world.tscn")

  
