extends Node
# håndterer lyd i spillet

# INFO
# hvis du skal spille en lyd i en scene call funksjonen til lyden som så:
#	SoundManager.test()

# INFO
# lydfiler har ikke blitt lagdt til enda, så ingen lyd blir spilt av.

func _ready():
	print('sound manager loaded')

func test(): # for testing
	print('SoundManager test 🎵')

func play_background_music(track_to_play):
	# stopper andre bakgrunnsmusikk for å unngå at de spilles samtidig
	# restarter ikke musikken hvis track_to_play alerede spilles
	for track in $BackgroundMusic.get_children():
		if track.playing and track != track_to_play:
			track.stop()
		elif track == track_to_play and not track.playing:
			track.play()

func adjust_music_volume(value):
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("music"),
		linear_to_db(value)
	)
	print('music volume set to ', value)

func adjust_sound_effect_volume(value):
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("sfx"),
		linear_to_db(value)
	)
	print('SFX volume set to ', value)

func button():
	# blir kansje laget mer spesifikke knappelyder.
	$SoundEffects/ButtonClick.play()

func skike_trail():
	$SoundEffects/SkikeTrail.play()

func skike_asphalt():
	$SoundEffects/SkikeAsphalt.play()

func skike_gravel():
	$SoundEffects/SkikeGravel.play()

func pickup():
	$SoundEffects/Collectible.play()

func jump():
	$SoundEffects/Jump.play()

func landing():
	$SoundEffects/Land.play()

func duck():
	$SoundEffects/Duck.play()

func win_sound():
	$SoundEffects/Win.play()

func lose_sound():
	$SoundEffects/Lose.play()

func play_background_forest():
	play_background_music($BackgroundMusic/ForestTrack)

func play_background_mountain():
	play_background_music($BackgroundMusic/MountainTrack)

func play_background_menu():
	play_background_music($BackgroundMusic/MenuTrack)

func play_background_cutscene():
	play_background_music($BackgroundMusic/CutsceneTrack)

# INFO ambient lyder lagdt til som lydeffekter, ikke bakgrunnsmusikk
func ambient_forest():
	$SoundEffects/AmbientForest.play()

func ambient_mountain():
	$SoundEffects/AmbientMountain.play()
