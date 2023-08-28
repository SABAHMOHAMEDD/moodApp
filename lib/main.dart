import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moodapp/features/home/pages/home_screen.dart';
import 'package:moodapp/test.dart';

import 'features/music/pages/music_screen.dart';
import 'features/playList/pages/playlist_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.RouteName: (_) => HomeScreen(),
        MusicScreen.RouteName: (_) => MusicScreen(),
        PlayListScreen.RouteName: (_) => PlayListScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AudioPlayerPage(),
    );
  }
}
