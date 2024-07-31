import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Bombarman());
}

class Bombarman extends StatefulWidget {
  @override
  // State<Bombarman> createState() => _BombarmanState();
  State<Bombarman> createState() {
    _BombarmanState b1 = new _BombarmanState();
    return b1;
  }
}

class _BombarmanState extends State<Bombarman> {
  // Initialize the list with the initial images
  List<String> buttonImages =
  List.generate(9, (index) => "image/g1_128.png");
  List<int> list = List.filled(9, 0); // Initialize list with 9 zeros
  bool isPlaying = false;
  bool isGameOver = false;
  String message = "";
  int coins = 100;
  int round = 0;
  String color = "";
  String ButtonLabel = "";
  
  void generateRandomList() {
    Random random = Random();
    // Generate a random index for the one
    int index = random.nextInt(9);
    list[index] = 1;
    print("generateRandomList() method is called.....");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState() method is called.....");
    generateRandomList();
    playBackgroundMusic();
  }
  void playBackgroundMusic() {
    //await _audioPlayer.play(AssetSource('sound/lost.mp3'));
    //isPlaying = true;
    AssetsAudioPlayer.newPlayer().open(
      Audio("sound/game.mp3"),
      autoStart: true,
      loopMode: LoopMode.single, // This will loop the audio
    );
  }
  void playdiamond() {
    //await _audioPlayer.play(AssetSource('sound/lost.mp3'));
    //isPlaying = true;
    AssetsAudioPlayer.newPlayer().open(
      Audio("sound/diamond.mp3"),
      autoStart: true,
    );
  }
  void playblast() {
    //await _audioPlayer.play(AssetSource('sound/lost.mp3'));
    //isPlaying = true;
    AssetsAudioPlayer.newPlayer().open(
      Audio("sound/blast.mp3"),
      autoStart: true,
    );
  }
  void playwin() {
    //await _audioPlayer.play(AssetSource('sound/lost.mp3'));
    //isPlaying = true;
    AssetsAudioPlayer.newPlayer().open(
      Audio("sound/win.mp3"),
      autoStart: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    print("build() method is called.....");
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          title: Text('Bombar Man Game',style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xffFB636F),
        ),

        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    message,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: buildRow(0),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: buildRow(3),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: buildRow(6),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:30),
                  child:ButtonLabel.isEmpty
                      ? Container()
                      : MaterialButton(
                    child: Text(ButtonLabel),
                    color: Color(0xffFB636F),
                    textColor: Colors.white,
                    onPressed: () {
                      if (isGameOver == true) {
                        setState(() {
                          ButtonLabel = "";
                          isGameOver = false;
                          round = 0;
                          coins = 100;
                          message = "";
                          buttonImages =
                              List.generate(9, (index) => "image/g1_128.png");
                          generateRandomList();
                        });
                      }
                        if (round >= 2) {
                          setState(() {
                            isGameOver = true;
                            message =
                                "Congraulation, you win " + coins.toString();
                            round = 0;
                            ButtonLabel = "start game";
                            playwin();
                          });
                        }
                        print("quit button clicked");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Text(
                    "your coins = " + coins.toString(),
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build a row of buttons
  Row buildRow(int startIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton(startIndex),
        buildButton(startIndex + 1),
        buildButton(startIndex + 2),
      ],
    );
  }

  // Build a button with an image
  Widget buildButton(int index) {
    return MaterialButton(
      color: Colors.transparent,
      elevation: 0,
      highlightElevation: 0,
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          if (isGameOver == false) {
            round++;
            if (round >= 2) {
              setState(() {
                ButtonLabel = "I want to quit";
              });
            }
            if (list[index] == 1) {
              buttonImages[index] = "image/b1_128.png";
              isGameOver = true;
              message = "Game Over";
              coins = 0;
              setState(() {
                ButtonLabel = "start game";
              });
              playblast();
            } else {
              buttonImages[index] = "image/d1_128.png";
              coins = coins * 2;
              playdiamond();
              if (round == 8) {
                message = "you won";
                playwin();
                setState(() {
                  ButtonLabel = "start game";
                  isGameOver = true;
                  message = "You Won $coins";
                });
              }
            }
          }
        });
      },
      child: Image.asset(
        buttonImages[index],
        width: 100,
        height: 100,
      ),
    );
  }
}