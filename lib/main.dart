import 'package:f36_appjam_project/chat_screen.dart';
import 'package:f36_appjam_project/theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RankAdemy',
        debugShowCheckedModeBanner: false,
          theme: LightTheme().theme,
         home: ChatScreen()
    );
  }
}

  

