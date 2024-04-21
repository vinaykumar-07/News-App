import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/screen/ome_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter News App',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // Define the light theme
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        // Additional theme configurations...
      ),
      darkTheme: ThemeData(
        // Define the dark theme
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        // Additional theme configurations...
      ),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
      initialBinding: NewsBinding(), // Initialize controller binding
    );
  }
}

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController()); // Initialize NewsController
  }
}
