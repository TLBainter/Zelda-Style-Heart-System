#region DETAILS==============#
class_name PlayerUX
extends Control
#endregion DETAILS==============#

#region VARIABLES==============#
@export_group("Debug")
@export var debug_me : bool = false
@export var debug_name : String = "Player UX"
@export_group("PlayerUX External Components")
@export var player : Node2D
@export_group("PlayerUX Internal Components")
@export var hearts_grid : HeartGrid
#endregion VARIABLES==============#

#region FUNCTIONS==============#
func _ready():
	var hp_component : HealthComponent = player.health
	hearts_grid.set_max_hearts(hp_component.max_hearts)
	hearts_grid.update_hearts(hp_component.cur_health)
	hp_component.healthChanged.connect(_on_health_changed)

func _on_health_changed(new_hp, _max_hp, _change):
	hearts_grid.update_hearts(new_hp)

#endregion FUNCTIONS==============#
