import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import './band.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: App());
  }
}

AudioPlayer pauseSongs = AudioPlayer();
String songName = '';
bool paused = true;

class App extends StatefulWidget {
  static AudioCache player = AudioCache();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  void _openSong(String song) async {
    if (songName != '') {
      if (songName == song && paused) {
        pauseSongs.pause();
        paused = false;
      } else if (songName == song) {
        pauseSongs.resume();
        paused = true;
      } else {
        paused = true;
        pauseSongs.stop();
        songName = song;
        await App.player.load(song);
        pauseSongs = await App.player.loop(song);
      }
    } else {
      songName = song;
      await App.player.load(song);
      pauseSongs = await App.player.loop(song);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kpop Killing Parts'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Band(
                  Image.asset(
                    'assets/images/BTS.jpeg',
                    fit: BoxFit.cover,
                  ),
                  'BTSDynamiteShort.mp3',
                  _openSong,
                  (songName == 'BTSDynamiteShort.mp3' && paused)
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow)),
              Band(
                  Image.asset('assets/images/BP.jpeg', fit: BoxFit.cover),
                  'BlackPinkPrettySavageShort.mp3',
                  _openSong,
                  (songName == 'BlackPinkPrettySavageShort.mp3' && paused)
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow)),
              Band(
                  Image.asset('assets/images/EXO.jpeg', fit: BoxFit.cover),
                  'EXOObsessionShort.mp3',
                  _openSong,
                  (songName == 'EXOObsessionShort.mp3' && paused)
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow)),
              Band(
                  Image.asset('assets/images/TWICE.jpeg', fit: BoxFit.cover),
                  'TwiceICantStopMeShort.mp3',
                  _openSong,
                  (songName == 'TwiceICantStopMeShort.mp3' && paused)
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow)),
              Band(
                  Image.asset('assets/images/TXT.jpeg', fit: BoxFit.cover),
                  'TXTCantYouSeeMeShort.mp3',
                  _openSong,
                  (songName == 'TXTCantYouSeeMeShort.mp3' && paused)
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow)),
              Band(
                  Image.asset('assets/images/ITZY.jpeg', fit: BoxFit.cover),
                  'ITZYNotShyShort.mp3',
                  _openSong,
                  ((songName == 'ITZYNotShyShort.mp3' && paused)
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow))),
              Band(
                  Image.asset('assets/images/KARD.jpeg', fit: BoxFit.fill),
                  'KARDGunShotShort.mp3',
                  _openSong,
                  (songName == 'KARDGunShotShort.mp3' && paused)
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow))
            ],
          ),
        ),
      ),
    );
  }
}
