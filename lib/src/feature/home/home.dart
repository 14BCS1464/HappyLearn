import 'package:abcd/src/feature/matchGame/temp.dart';
import 'package:abcd/src/feature/utils/sizes_helpers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double textFieldWidth;

  final player = AudioPlayer();
  // SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  @override
  initState() {
    super.initState();
    initializeSpeach();
  }

  Future<void> initializeSpeach() async {
    // speechEnabled = await speechToText.initialize();
    setState(() {});
  }

  final List<Map<String, String>> alphabetList = [
    {
      'capital': 'A',
      'small': 'a',
      'image': 'assets/icons/_ic_apple1.png',
      "text": "Apple",
      'audio': 'sounds/a.mp3',
      "str": "A for Apple"
    },
    {
      'capital': 'B',
      'small': 'b',
      'image': 'assets/icons/_ic_ball.jpg',
      "text": "Ball",
      'audio': 'sounds/b.mp3',
      "str": "B for ball"
    },
    {
      'capital': 'C',
      'small': 'c',
      'image': 'assets/icons/_ic_cat.jpg',
      "text": "Cat",
      'audio': 'sounds/c.mp3',
      "str": "B for Cat"
    },
    {
      'capital': 'D',
      'small': 'd',
      'image': 'assets/icons/_ic_dog.jpg',
      "text": "Dog",
      'audio': 'sounds/d.mp3',
      "str": "D for Dog"
    },
    {
      'capital': 'E',
      'small': 'e',
      'image': 'assets/icons/_ic_elephant.jpg',
      "text": "Elephant",
      'audio': 'sounds/e.mp3',
      "str": "E for Elephant"
    },
    {
      'capital': 'F',
      'small': 'f',
      'image': 'assets/icons/_ic_fish.jpg',
      "text": "Fish",
      'audio': 'sounds/f.mp3',
      "str": "F for Fish"
    },
    {
      'capital': 'G',
      'small': 'g',
      'image': 'assets/icons/_ic_grapes.jpg',
      "text": "Grapes",
      'audio': 'sounds/g.mp3',
      "str": "g for Grapes"
    },
    {
      'capital': 'H',
      'small': 'h',
      'image': 'assets/icons/_ic_hen.jpg',
      "text": "Hen",
      'audio': 'sounds/h.mp3',
      "str": "H for Hen"
    },
    {
      'capital': 'I',
      'small': 'i',
      "text": "Ice-Cream",
      'image': 'assets/icons/_ic_ice.jpg',
      'audio': 'sounds/i.mp3',
      "str": "I for Ice-Cream"
    },
    {
      'capital': 'J',
      'small': 'j',
      "text": "Joker",
      'image': 'assets/icons/_ic_jocker.jpg',
      'audio': 'sounds/j.mp3',
      "str": "J for Joker"
    },
    {
      'capital': 'K',
      'small': 'k',
      "text": "Kite",
      'image': 'assets/icons/_ic_kite.jpg',
      'audio': 'sounds/k.mp3',
      "str": "K for Kite"
    },
    {
      'capital': 'L',
      'small': 'l',
      "text": "Lion",
      'image': 'assets/icons/_ic_lion.png',
      'audio': 'sounds/l.mp3',
      "str": "l for Lion"
    },
    {
      'capital': 'M',
      'small': 'm',
      "text": "Monkey",
      'image': 'assets/icons/_ic_monkey.jpg',
      'audio': 'sounds/m.mp3',
      "str": "M for Monkey"
    },
    {
      'capital': 'N',
      'small': 'n',
      "text": "Nest",
      'image': 'assets/icons/_ic_nest.jpg',
      'audio': 'sounds/n.mp3',
      "str": "N for Nest"
    },
    {
      'capital': 'O',
      'small': 'o',
      "text": "Owl",
      'image': 'assets/icons/_ic_owl.jpg',
      'audio': 'sounds/o.mp3',
      "str": "O for Owl"
    },
    {
      'capital': 'P',
      'small': 'p',
      "text": "Parrot",
      'image': 'assets/icons/_ic_p.jpg',
      'audio': 'sounds/p.mp3',
      "str": "P for Parrot"
    },
    {
      'capital': 'Q',
      'small': 'q',
      "text": "Queen",
      'image': 'assets/icons/_ic_q.jpg',
      'audio': 'sounds/q.mp3',
      "str": "Q for Queen"
    },
    {
      'capital': 'R',
      'small': 'r',
      "text": "Rat",
      'image': 'assets/icons/_ic_r.jpg',
      'audio': 'sounds/r.mp3',
      "str": "R for Rat"
    },
    {
      'capital': 'S',
      'small': 's',
      "text": "Ship",
      'image': 'assets/icons/_ic_s.jpg',
      'audio': 'sounds/s.mp3',
      "str": "S for Ship"
    },
    {
      'capital': 'T',
      'small': 't',
      'image': 'assets/icons/_ic_t.jpg',
      "text": "Tiger",
      'audio': 'sounds/t.mp3',
      "str": "T for Tiger"
    },
    {
      'capital': 'U',
      'small': 'u',
      'image': 'assets/icons/_ic_u.jpg',
      "text": "Umbrella",
      'audio': 'sounds/u.mp3',
      "str": "U for Umbrella"
    },
    {
      'capital': 'V',
      'small': 'v',
      'image': 'assets/icons/_ic_v.jpg',
      "text": "Van",
      'audio': 'sounds/v.mp3',
      "str": "V for Van"
    },
    {
      'capital': 'W',
      'small': 'w',
      'image': 'assets/icons/_ic_w.jpg',
      "text": "Whale",
      'audio': 'sounds/w.mp3',
      "str": "W for Whale"
    },
    {
      'capital': 'X',
      'small': 'x',
      'image': 'assets/icons/_ic_x.jpg',
      "text": "x-mes-Tree",
      'audio': 'sounds/x.mp3',
      "str": "X for x-mes-Tree"
    },
    {
      'capital': 'Y',
      'small': 'y',
      'image': 'assets/icons/_ic_y.jpg',
      "text": "Yak",
      'audio': 'sounds/y.mp3',
      "str": "Y for Yak"
    },
    {
      'capital': 'Z',
      'small': 'z',
      "text": "Zebra",
      'image': 'assets/icons/_ic_z.jpg',
      'audio': 'sounds/z.mp3',
      "str": "Z for Zebra"
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      textFieldWidth = displayWidth(context) * 0.35;
    } else {
      textFieldWidth = displayWidth(context) * 0.8;
    }

    return Scaffold(
      body: Material(
        color: Colors.black12,
        child: Center(
          child: Container(
            height: displayHeight(context), // Adjust the height as needed
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: displayHeight(context) * 0.9,
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 0,
                      onPageChanged: onPageChanged,
                      enableInfiniteScroll: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    items: alphabetList.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              Container(
                                height: displayHeight(context) * 0.8,
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
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      '${item['image']}',
                                      width: kIsWeb ? 120.h : 200.h,
                                      height: kIsWeb ? 200.h : 200.h,
                                      fit: BoxFit.contain,
                                    ),
                                    Text(
                                      '${item['text']}',
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.blueGrey,
                                          // fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Jackpot'),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${item['capital']}',
                                            style: const TextStyle(
                                                fontSize: 100,
                                                color: Colors.grey,
                                                // fontWeight: FontWeight.w600,
                                                // fontStyle: FontStyle.normal,
                                                fontFamily: 'Jackpot'),
                                          ),
                                          Text(
                                            '${item['small']}',
                                            style: const TextStyle(
                                                fontSize: 40.0,
                                                color: Colors.blue,
                                                // fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                fontFamily: 'Jackpot'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(lastWords,
                                        style: lastWords.toLowerCase() ==
                                                '${item['str']}'.toLowerCase()
                                            ? TextStyle(
                                                fontSize: 18,
                                                color: Colors.green)
                                            : TextStyle(
                                                fontSize: 18,
                                                color: Colors.red)),
                                    Container(
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () =>
                                                _play('${item['audio']}'),
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h,
                                                  horizontal: 10.w),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              primary: Colors.amberAccent,
                                            ),
                                            child: const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(width: 8.0),
                                                Text(
                                                  'Play audio',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if ('${item['capital']}' == "Z")
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushNamed("/MatchGame");
                                              },
                                              style: ElevatedButton.styleFrom(
                                                 padding:EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),

                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              child: const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(width: 8.0),
                                                  Text(
                                                    'Play Game',
                                                    style: TextStyle(
                                                        fontSize: 16.0),
                                                  ),
                                                ],
                                              ),
                                            )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed:
      //       speechToText.isNotListening ? _startListening : _stopListening,
      //   tooltip: 'Listen',
      //   child: AvatarGlow(
      //     animate: true,
      //     child: Material(
      //       elevation: 10.0,
      //       shape: const CircleBorder(),
      //       child: CircleAvatar(
      //         backgroundColor: Colors.grey[100],
      //         radius: 50,
      //         child:
      //             Icon(speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Future<void> _play(sound) async {
    await player.play(AssetSource(sound));
  }

  // void _startListening() async {
  //   await player.play(AssetSource('sounds/beep.mp3'));
  //   await speechToText.listen(onResult: _onSpeechResult);
  //   setState(() {});
  // }

  // void _stopListening() async {
  //   await speechToText.stop();
  //   setState(() {});
  // }

  // void _onSpeechResult(SpeechRecognitionResult result) {
  //   setState(() {
  //     lastWords = result.recognizedWords;
  //   });
  // }

  Future<void> onPageChanged(
      int index, CarouselPageChangedReason reason) async {
   // _stopListening();
    await player.stop();
    setState(() {
      lastWords = "";
    });
  }
}
