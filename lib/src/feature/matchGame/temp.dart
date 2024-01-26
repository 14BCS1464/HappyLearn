import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audioplayers/audioplayers.dart';
class MatchGame extends StatefulWidget {
  const MatchGame({Key? key}) : super(key: key);

  @override
  State<MatchGame> createState() => _MatchGameState();
}

class _MatchGameState extends State<MatchGame> {
  final Map<String, bool> score = {};
  final Map<String, String> choices = {
    'assets/icons/_ic_apple1.png': "A",
    'assets/icons/_ic_ball.jpg': "B",
    'assets/icons/_ic_cat.jpg': "C",
    'assets/icons/_ic_dog.jpg': "D",
    
  };
    final player = AudioPlayer();

  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Play and enjoy")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((key) {
              return Draggable<String>(
                data: key,
                feedback: Emoji(emoji: key),
                childWhenDragging: const Emoji(emoji: "assets/icons/_ic_moto.jpg"),
                child: Emoji(emoji: score[key] == true ? "correct" : key),
              );
            }).toList()
              ..shuffle(Random(seed)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((key) {
              return DragTarget<String>(
                builder: (context, incoming, rejected) {
                  return Container(
                    alignment: Alignment.center,
                    height: 100.h,
                    width: 100.w,
                    color: Colors.white,
                    // padding: const EdgeInsets.all(10),
                    child: score[key] == true
                        ? Image.asset("assets/icons/_ic_moto.jpg",fit: BoxFit.contain)
                        : Text(
                            choices[key]!,
                            style: TextStyle(fontSize: 70.sp),
                          ),
                  );
                },
                onWillAccept: (data) => data == key,
                onAccept: (data) {
     
                     _play();
                  setState(() {
                    score[key] = true;
                  });
                },
                onLeave: (data) {


                 
                },
              );
            }).toList()
             ,
          ),
        ],
      ),
    );
  }
   Future<void> _play() async {
    await player.play(AssetSource('sounds/correct.mp3'));
  }
}

class Emoji extends StatefulWidget {
  const Emoji({
    Key? key,
    required this.emoji,
  }) : super(key: key);


  final String emoji;

  @override
  State<Emoji> createState() => _EmojiState();
}

class _EmojiState extends State<Emoji> {
void initState() {
     super.initState();

  }

  @override
  Widget build(BuildContext context) {
     Color randomColor() =>
      Colors.white.withOpacity(0.0);
    return Material(
      color: Colors.white,
      child:Container(
          decoration: BoxDecoration(
            color: randomColor(),
          ),
          child: Image.asset(widget.emoji == "correct" ? "assets/icons/_ic_moto.jpg" : widget.emoji,   height: 100.h,
        width: 100.w),
          ),
        
      
    );
  }
}

//colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
 


         