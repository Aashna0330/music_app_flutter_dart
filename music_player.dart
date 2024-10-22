import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Music {
  final String title;
  final String artist;
  final String path;

  const Music({required this.title, required this.artist, required this.path});
}

class MusicPlayer extends StatefulWidget {
  final List<Music> songs = [
    Music(
      title: 'O Maahi',
      artist: 'Arijit Singh',
      path:
          "C:\Users\aashn\OneDrive\Desktop\5TH SEM\MAD PROJECT\music_app\song3.mp3",
    ),
    Music(
      title: 'Sajni',
      artist: 'Arijit Singh',
      path:
          "C:\Users\aashn\OneDrive\Desktop\5TH SEM\MAD PROJECT\music_app\song2.mp3",
    ),
    Music(
      title: 'Pehle Bhi Main',
      artist: 'Vishal Mishra',
      path:
          "C:\Users\aashn\OneDrive\Desktop\5TH SEM\MAD PROJECT\music_app\song1.mp3",
    ),
  ];
  final int initialIndex;

  MusicPlayer({Key? key, required this.songs, this.initialIndex = 0})
      : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _currentIndex = 0;
  bool _isPlaying = false;
  List<AudioSource> _audioSources = [];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _loadAudioSources();
    _playMusic();
  }

  void _loadAudioSources() {
    _audioSources =
        widget.songs.map((song) => AudioSource.asset(song.path)).toList();
  }

  void _playMusic() async {
    if (_audioSources.isEmpty) {
      // Handle empty song list (e.g., show a message)
      return;
    }

    if (_currentIndex >= _audioSources.length) {
      // Handle invalid index (e.g., reset to first song)
      _currentIndex = 0;
    }

    try {
      await _audioPlayer.play(_audioSources[_currentIndex]);
      setState(() {
        _isPlaying = true;
      });
    } catch (e) {
      print('Error playing music: $e');
    }

    _audioPlayer.onPlayerComplete.listen((event) {
      _nextTrack();
    });
  }

  void _pauseMusic() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  void _nextTrack() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _audioSources.length;
      _playMusic();
    });
  }

  void _previousTrack() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _audioSources.length;
      _playMusic();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.songs[_currentIndex].title} - ${widget.songs[_currentIndex].artist}',
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _isPlaying ? _pauseMusic : _playMusic,
                  icon: _isPlaying
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                ),
                IconButton(
                    onPressed: _previousTrack,
                    icon: const Icon(Icons.skip_previous)),
                IconButton(
                    onPressed: _nextTrack, icon: const Icon(Icons.skip_next)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
