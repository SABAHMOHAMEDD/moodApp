import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer audioPlayer;
  String audioPath =
      'assets/Sm3na_com_68473.mp3'; // Replace with your audio file path

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio() async {
    final player = AudioPlayer();
    await player.play(AssetSource("sounds/Sm3na_com_68473.mp3"));
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: playAudio,
              child: Text('Play'),
            ),
            MaterialButton(
              onPressed: pauseAudio,
              child: Text('Pause'),
            ),
            MaterialButton(
              onPressed: stopAudio,
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
