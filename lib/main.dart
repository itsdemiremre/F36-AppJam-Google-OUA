import 'package:f36_appjam_project/theme/light_theme.dart';
import 'package:f36_appjam_project/chatScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
          theme: LightTheme().theme,


         home: ChatScreen(),
    );
  }
}

  

