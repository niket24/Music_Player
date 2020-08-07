import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:media_player_app/ui/video.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

AudioPlayer audioPlayer = new AudioPlayer();
var ap = new AudioCache(fixedPlayer: audioPlayer);

playonline() async {
  ap.clearCache();
  await audioPlayer
      .play('https://raw.githubusercontent.com/niket24/pic/master/say.mp3');
}

pause() {
  audioPlayer.pause();
}

stop() {
  audioPlayer.stop();
}

home() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.pink.shade400);
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.pink.shade500,
          ),
          onPressed: () {},
        ),
        title: Text("Music Zone",
            style: TextStyle(
                color: Colors.pink.shade700, fontFamily: "Nexa", fontSize: 25)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.pink.shade500,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.pink.shade200,
              shape: BoxShape.circle,
            ),
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.all(100),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://raw.githubusercontent.com/niket24/pic/master/123.jpg'),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 380),
            width: 290,
            height: 65,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink.shade700, width: 3.0),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: pause,
                  child: Icon(
                    Icons.pause,
                    color: Colors.pink.shade500,
                  ),
                ),
                FlatButton(
                  onPressed: playonline,
                  child: Icon(Icons.play_circle_filled,
                      size: 61, color: Colors.pink.shade500),
                ),
                FlatButton(
                  onPressed: stop,
                  child: Icon(Icons.stop, color: Colors.pink.shade500),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 480),
            height: 190.0,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: -25,
                  child: Container(
                    width: 50.0,
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFFE1483),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0))),
                  ),
                ),
                Positioned(
                  right: -25,
                  child: Container(
                    width: 50.0,
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFFE1483),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 29,
                    right: 29,
                    top: 8,
                  ),
                  child: new SamplePlayer(),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
