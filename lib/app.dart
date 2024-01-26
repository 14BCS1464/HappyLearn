

import 'package:abcd/src/feature/home/home.dart';
import 'package:abcd/src/feature/matchGame/matchGame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override

   Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 816),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_ , child) {
        return SafeArea(
      child: MaterialApp(
         debugShowCheckedModeBanner: false,

        initialRoute: '/',

        routes: {
          '/': (context) =>  Home(),
          '/MatchGame': (context) =>  const MatchGame(),
                      
          
        },
      ),
    );
      },
      
    );
  }
}