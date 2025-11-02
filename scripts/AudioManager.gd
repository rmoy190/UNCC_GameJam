extends Node

var num_players = 8
var bus = "master"

var available = []
var queue = []
var vol_queue: Array[float] = []

var last_pitch = 1.0

func _ready() -> void:
	for i in num_players:
		var player = AudioStreamPlayer.new()
		add_child(player)
		available.append(player)
		player.finished.connect(_on_stream_finished.bind(player))
		player.bus = bus

func _on_stream_finished(stream):
	available.append(stream)

func play(sound_path, volume_change: float = 0):
	queue.append(sound_path)
	vol_queue.append(volume_change)

func _process(delta: float) -> void:
	if not queue.is_empty() and not available.is_empty():
		var cur_player: AudioStreamPlayer = available[0]
		cur_player.stream = load(queue.pop_front())
		cur_player.volume_db = cur_player.volume_db + vol_queue.pop_front()
		
		randomize()
		cur_player.pitch_scale = randf_range(0.8, 1.2)
		
		while abs(cur_player.pitch_scale - last_pitch) < .1:
			randomize()
			cur_player.pitch_scale = randf_range(0.8, 1.2)
		
		last_pitch = cur_player.pitch_scale
		cur_player.play()

		available.pop_front()
