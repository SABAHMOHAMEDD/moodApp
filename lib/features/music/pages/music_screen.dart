import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/constance/constants.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);
  static const String RouteName = 'MusicScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 531,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/img_16.png"),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                        style: TextStyle(fontSize: 13, color: KLightFontColor),
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
                        style: TextStyle(fontSize: 13, color: KLightFontColor),
                      ),
                      Text(
                        "David Manson - The ways to live",
                        style: TextStyle(fontSize: 12, color: KLightFontColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProgressBar(
                    thumbColor: Color(0xFFF42E4CE),
                    progress: Duration(milliseconds: 1000),
                    //   buffered: Duration(milliseconds: 2000),
                    total: Duration(milliseconds: 5000),
                    progressBarColor: Color(0xFFF42E4CE),
                    // bufferedBarColor: Color(0xFF42E4CE),
                    baseBarColor: Color(0xFFF1F1F1),
                    onSeek: (duration) {
                      print('User selected a new time: $duration');
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/previous_btn.png",
                          height: 53,
                          width: 53,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/play_btn.png",
                          height: 53,
                          width: 53,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/next_btn.png",
                          height: 53,
                          width: 53,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
