import 'package:flutter/material.dart';
import 'package:formation_flutter/Views/Home_page.dart';
import 'package:formation_flutter/Views/Programme_cours.dart';
import 'package:formation_flutter/Views/Set_pg.dart';
import 'package:formation_flutter/Views/Splash_acreen.dart';
import 'package:formation_flutter/Views/videopage.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home:YouTubePlayerPage()
    );
  }
}
