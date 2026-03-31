#region DETAILS==============#
class_name HeartGrid
extends GridContainer
#endregion DETAILS==============#

#region VARIABLES==============#
@export_category("Debug")
@export var debug_me : bool = false
@export var debug_name : String = "Hearts Grid Container"
@export_category("Hearts Display Components")
@export var heart_gui : PackedScene
@export var root : Control
#region VARIABLES==============#

#region FUNCTIONS==============#

func set_max_hearts(max_hearts : int):
	for child in get_children():
		child.queue_free()
	for i in range(max_hearts):
		var heart = heart_gui.instantiate()
		add_child(heart)

func update_hearts(cur_health : int):
	var hearts = get_children()
	for i in range(hearts.size()):
		var heart = hearts[i] as HeartGUI
		var heart_fill_value = clampi(cur_health - (i * 4), 0, 4)
		heart.update(heart_fill_value)
#endregion FUNCTIONS==============#
