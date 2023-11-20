extends PanelContainer

signal start_day

func _on_play_button_down():
	Manager._buy_supplies()
	start_day.emit()
