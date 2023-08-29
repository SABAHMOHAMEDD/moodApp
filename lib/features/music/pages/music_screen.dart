import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../core/constance/constants.dart';

class MusicScreen extends StatefulWidget {
  static const String RouteName = 'MusicScreen';
  int currentIndex = 0;
  List<String> audioPaths = [
    "sounds/Sm3na_com_56801.mp3",
    "sounds/Sm3na_com_62296.mp3",
    "sounds/Sm3na_com_68473.mp3",
    "sounds/Sm3na_com_70585.mp3",
    "sounds/Sm3na_com_71392.mp3"
  ];
  List<String> imagePaths = [
    "assets/images/img_7.png",
    "assets/images/img_8.png",
    "assets/images/img_5.png",
    "assets/images/img_10.png",
    "assets/images/img_11.png"
  ];

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false; // Track the playing state of the audio

  Duration audioDuration = Duration();
  Duration progress = Duration();

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      // Listen to the player state changes
      if (state == PlayerState.playing) {
        setState(() {
          isPlaying = true;
        });
      } else {
        setState(() {
          isPlaying = false;
        });
      }
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        progress = position;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio(audioPath) async {
    await audioPlayer.play(AssetSource(audioPath));
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
  }

  void seekAudio(Duration duration) {
    audioPlayer.seek(duration);
  }

  void goToNextSong() {
    if (widget.currentIndex < widget.audioPaths.length - 1) {
      setState(() {
        widget.currentIndex++;
      });
      stopAudio();
      playAudio(widget.audioPaths[widget.currentIndex]);
    }
  }

  void goToPreviousSong() {
    if (widget.currentIndex > 0) {
      setState(() {
        widget.currentIndex--;
      });
      stopAudio();
      playAudio(widget.audioPaths[widget.currentIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    // var audioPath = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: PageView.builder(
        itemCount: widget.audioPaths.length,
        controller: PageController(initialPage: widget.currentIndex),
        onPageChanged: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          var audioPath = widget.audioPaths[index];
          var imagePath = widget.imagePaths[index];

          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 531,
                  child: Stack(
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage(imagePath),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Feeling Arty \nFarty',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: KFontColor),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/images/Path 38.png",
                              height: 7,
                              width: 28,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Text(
                            "35 min   .  12 Tracks",
                            style:
                                TextStyle(fontSize: 13, color: KLightFontColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Playing next",
                            style:
                                TextStyle(fontSize: 13, color: KLightFontColor),
                          ),
                          Text(
                            "David Manson - The ways to live",
                            style:
                                TextStyle(fontSize: 12, color: KLightFontColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProgressBar(
                        thumbColor: const Color(0xFFF42E4CE),
                        progress: progress,
                        buffered: audioDuration,
                        // You can update this value if buffering is supported
                        total: audioDuration,
                        progressBarColor: const Color(0xFFF42E4CE),
                        bufferedBarColor:
                            const Color(0xFF42E4CE).withOpacity(0.3),
                        baseBarColor: const Color(0xFFF1F1F1),
                        onSeek: (duration) {
                          seekAudio(duration);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              goToPreviousSong();
                            },
                            icon: Image.asset(
                              "assets/images/previous_btn.png",
                              height: 53,
                              width: 53,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (isPlaying) {
                                pauseAudio();
                              } else {
                                playAudio(audioPath);
                              }
                            },
                            icon: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              size: 53,
                              color: KPrimaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              goToNextSong();
                            },
                            icon: Image.asset(
                              "assets/images/next_btn.png",
                              height: 53,
                              width: 53,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
