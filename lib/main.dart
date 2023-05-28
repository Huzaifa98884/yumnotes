import 'package:flutter/material.dart';
import 'package:yumnotes/constants/constants.dart';
import 'package:yumnotes/views/Home.dart';
import 'package:yumnotes/views/Splash.dart';
import 'package:sizer/sizer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'YumNotes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kScaffoldBg,
          appBarTheme: AppBarTheme(backgroundColor: kAppbarBg),
          primarySwatch: Colors.blue,
        ),
        home: //HomeScreen()
            const SplashScreen(),
      );
    });
  }
}
