import 'package:f36_appjam_project/homeScreen.dart';

import 'auth_page.dart';
import 'chat_screen.dart';
import 'package:f36_appjam_project/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'start_page.dart';

import 'package:f36_appjam_project/sinavlar.dart';
import 'auth_page.dart';
import 'chat_screen.dart';
import 'package:f36_appjam_project/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'start_page.dart';

import 'package:f36_appjam_project/sinavlar.dart';
import 'auth_page.dart';
import 'chat_screen.dart';
import 'package:f36_appjam_project/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: StartPage(),
    );
        theme: LightTheme().theme,
        home: StartPage());
  }
}
