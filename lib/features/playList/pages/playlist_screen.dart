import 'package:flutter/material.dart';
import 'package:moodapp/features/music/pages/music_screen.dart';

class PlayListScreen extends StatelessWidget {
  static const String RouteName = 'PlayListScreen';

  String? imagePath, plantName;
  List<String> audioPathList = [
    "sounds/Sm3na_com_56801.mp3",
    "sounds/Sm3na_com_62296.mp3",
    "sounds/Sm3na_com_68473.mp3",
    "sounds/Sm3na_com_70585.mp3",
    "sounds/Sm3na_com_71392.mp3"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(11),
                bottomLeft: Radius.circular(11)),
            child: Image(
                width: 250,
                height: 250,
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/img_7.png',
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Funky VIBES'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MusicScreen.RouteName,
                          arguments: audioPathList[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Song Name",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(.9),
                                        fontSize: 17,
                                      )),
                                  Text("Artist Name",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(.9),
                                          fontSize: 12)),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/heart001 - E034.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
