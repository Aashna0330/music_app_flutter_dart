import 'package:flutter/material.dart';
import 'package:music_app/music_player.dart';
import 'package:music_app/music.dart';

class MusicLibrary extends StatefulWidget {
  final List<Music> songs;

  const MusicLibrary({Key? key, required this.songs}) : super(key: key);

  @override
  _MusicLibraryState createState() => _MusicLibraryState();
}

class _MusicLibraryState extends State<MusicLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Library'),
      ),
      body: ListView.builder(
        itemCount: widget.songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.songs[index].title),
            subtitle: Text(widget.songs[index].artist),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayer(songs: widget.songs, initialIndex: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}