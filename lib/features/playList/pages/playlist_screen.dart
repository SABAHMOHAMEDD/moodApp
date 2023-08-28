import 'package:flutter/material.dart';
import 'package:moodapp/features/music/pages/music_screen.dart';


class PlayListScreen extends StatelessWidget {
  static const String RouteName = 'PlayListScreen';

  String? imagePath, plantName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
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
          SizedBox(
            height: 20,
          ),
          Text('Funky VIBES'),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MusicScreen.RouteName);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                          Spacer(),
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
