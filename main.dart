import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_app/music.dart';
import 'package:music_app/music_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicPlayer(
        songs: [
          Music(
              title: 'O Maahi',
              artist: 'Arijit Singh',
              path:
                  "C:\Users\aashn\OneDrive\Desktop\5TH SEM\MAD PROJECT\music_app\song3.mp3"),
          Music(
              title: 'Sajni',
              artist: 'Arijit Singh',
              path:
                  "C:\Users\aashn\OneDrive\Desktop\5TH SEM\MAD PROJECT\music_app\song2.mp3"),
          Music(
              title: 'Pehle Bhi Main',
              artist: 'Vishal Mishra',
              path:
                  "C:\Users\aashn\OneDrive\Desktop\5TH SEM\MAD PROJECT\music_app\song1.mp3"),
        ],
      ),
    );
  }
}
