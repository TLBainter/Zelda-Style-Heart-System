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
	#Heart Pulsing Variables
	var active_heart_index = int(ceil(cur_health / 4.0)) -1
	#Core heart variables
	var hearts = get_children()
	#Heart Flashing Variables
	var max_hp : int = int(hearts.size() * 4)
	var low_hp_threshold : int = clampi(int(floor(max_hp * 0.25)), 4, 15)
	var hp_low : bool = (cur_health <= low_hp_threshold and cur_health > 0)
	#Heart filling and state setting
	for i in range(hearts.size()):
		var heart = hearts[i] as HeartGUI
		var heart_fill_value = clampi(cur_health - (i * 4), 0, 4)
		heart.update(heart_fill_value)
		#Set pulse
		var pulse : bool = (i==active_heart_index and heart_fill_value > 0)
		heart.pulse(pulse)
		#Set flash
		var flash : bool = (hp_low and heart_fill_value > 0)
		heart.flash(flash)
#endregion FUNCTIONS==============#
