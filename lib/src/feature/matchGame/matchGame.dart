import 'dart:math';
import 'package:abcd/src/feature/utils/sizes_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:vibration/vibration.dart';

class MatchGame extends StatefulWidget {
  const MatchGame({Key? key}) : super(key: key);

  @override
  State<MatchGame> createState() => _MatchGameState();
}

class _MatchGameState extends State<MatchGame> {
  Map<String, bool> score = {};

  int intValue = 0;
  int appempt = 0;
  


  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    intValue = Random().nextInt(10);
  }

  final List<Map<String, String>> choices = [
    {
      'assets/icons/_ic_apple1.png': "A",
      'assets/icons/_ic_ball.jpg': "B",
      'assets/icons/_ic_cat.jpg': "C",
      'assets/icons/_ic_dog.jpg': "D",
      'assets/icons/_ic_elephant.jpg': "E",
      'assets/icons/_ic_fish.jpg': "F",
    },
    {
      'assets/icons/_ic_grapes.jpg': "G",
      'assets/icons/_ic_hen.jpg': "H",
      'assets/icons/_ic_ice.jpg': "I",
      'assets/icons/_ic_jocker.jpg': "J",
      'assets/icons/_ic_kite.jpg': "K",
      'assets/icons/_ic_lion.png': "L",
    },
    {
      'assets/icons/_ic_monkey.jpg': "M",
      'assets/icons/_ic_nest.jpg': "N",
      'assets/icons/_ic_owl.jpg': "O",
      'assets/icons/_ic_p.jpg': "P",
      'assets/icons/_ic_q.jpg': "Q",
      'assets/icons/_ic_r.jpg': "R",
    },
    {
      'assets/icons/_ic_s.jpg': "S",
      'assets/icons/_ic_t.jpg': "T",
      'assets/icons/_ic_u.jpg': "U",
      'assets/icons/_ic_v.jpg': "v",
      'assets/icons/_ic_w.jpg': "W",
      'assets/icons/_ic_x.jpg': "X",
    },
    {
      'assets/icons/_ic_y.jpg': "Y",
      'assets/icons/_ic_z.jpg': "Z",
    }
  ];
  final player = AudioPlayer();

  int scorePoint = 0;

  bool isShaking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Match the column")),
      body: Material(
        child: Center(
          child: Container(
            height: displayHeight(context), // Adjust the height as needed
            color: Colors.black12,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Text(
                        "Score: ${scorePoint}" + "/26",
                        style: TextStyle(
                            fontFamily: 'Jackpot', color: Colors.black),
                      ),
                      margin: const EdgeInsets.only(
                          top: 10, right: 10), // Adjust the margin as needed
                    ),
                    Container(
                      child: Text(
                        "Attemp: " + '${appempt}',
                        style: TextStyle(
                            fontFamily: 'Jackpot', color: Colors.black),
                      ),
                      margin: const EdgeInsets.only(
                          top: 10, right: 10), // Adjust the margin as needed
                    ),
                  ],
                ),
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: displayHeight(context) * 0.9,
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 0,
                      onPageChanged: null,
                      enableInfiniteScroll: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    items: choices.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            height: displayHeight(context) * 0.7,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(6, 10), // Shadow position
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: item.keys.map((key) {
                                    return Draggable<String>(
                                      data: key,
                                      feedback: Emoji(emoji: key),
                                      childWhenDragging: Emoji(emoji: key),
                                      child: Emoji(emoji: key),
                                    );
                                  }).toList()
                                    ..shuffle(Random(intValue)),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: item.keys.map((key) {
                                    return DragTarget<String>(
                                      builder: (context, incoming, rejected) {
                                        return Container(
                                          alignment: Alignment.center,
                                          height: 60.h,
                                          width: 60.w,
                                          color: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: score[key] == true
                                              ? Image.asset(
                                                  "assets/icons/_ic_check.png",
                                                  fit: BoxFit.contain)
                                              : Text(
                                                  item[key]!,
                                                  style: TextStyle(
                                                      fontSize:kIsWeb?10.sp: 20.sp,
                                                      color: Colors
                                                          .deepPurpleAccent,
                                                      fontFamily: 'Jackpot'),
                                                ),
                                        );
                                      },
                                      onWillAccept: (data) => data == key,
                                      onAccept: (data) {
                                        if (!score.containsKey(data)) {
                                          _play();
                                          setState(() {
                                            score[key] = true;
                                            scorePoint = scorePoint + 1;
                                            appempt = appempt + 1;
                                          });
                                        }
                                      },
                                      onLeave: (data) {
                                        onLeave();
                                        setState(() {
                                          appempt = appempt + 1;
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _play() async {
    if (scorePoint < 25) {
      await player.play(AssetSource('sounds/correct.mp3'));

    } else if (scorePoint == 25) {
      await player.play(AssetSource('sounds/letsre_view.mp3'));
     // ignore: use_build_context_synchronously
     _showModal(context);
    }
  }

  Future<void> onLeave() async {
    await player.play(AssetSource('sounds/incorrect.mp3'));
    Vibration.vibrate(amplitude: 128);
  }

  void onPressed() {
    setState(() {
      score = {};
      scorePoint = 0;
      appempt = 0;
    });
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return Container(
          width: displayWidth(context),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    alignment: Alignment.center,
                    width: displayWidth(context) - 50,
                    child: Text(
                      "Congratulation",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: "Jackpot",
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    alignment: Alignment.center,
                    width: displayWidth(context) - 50,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Score",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: "Jackpot",
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '${scorePoint}',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: "Jackpot",
                                  color: Colors.black87,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Atemptted",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: "Jackpot",
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '${appempt}',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: "Jackpot",
                                  color: Colors.black87,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: onPressed, child: const Text("Restart Game"))
                ],
              ),
            ],
          ),
        );
      },
    );
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
    Color randomColor() => Colors.white.withOpacity(0.0);
    return Material(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            // color: randomColor(),
            ),
        child: Image.asset(
          widget.emoji == "correct"
              ? "assets/icons/_ic_moto.jpg"
              : widget.emoji,
          height: 70.h,
          width: 70.w,
        ),
      ),
    );
  }
}
