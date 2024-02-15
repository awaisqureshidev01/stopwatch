import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stopwatch/app_colors.dart';
import 'package:stopwatch/stopwatchscreen.dart';
late Size mq;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stopwatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        useMaterial3: true,
      ),
      home: StopWatchScreen(),
    );
  }
}
