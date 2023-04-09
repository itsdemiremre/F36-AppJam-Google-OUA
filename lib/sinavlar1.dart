//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:f36_appjam_project/moduller.dart';

class FlutterModuller extends StatefulWidget {
  const FlutterModuller({super.key});

  @override
  _FlutterModullerState createState() => _FlutterModullerState();
}

class _FlutterModullerState extends State<FlutterModuller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModulButonlari(),
        appBar: AppBar(
            backgroundColor: const Color(0xFFF8F8F8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            shadowColor: Colors.black.withOpacity(0.25),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4),
              child: Container(
                height: 4,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ]),
              ),
            ),
            title: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "FLUTTER SINAVLARI",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ],
              ),
            )));
  }
}

class ModulButonlari extends StatefulWidget {
  @override
  State<ModulButonlari> createState() => _ModulButonlariState();
}

class _ModulButonlariState extends State<ModulButonlari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FlutterBirinciModul(),
                  ));
                },
                child: const Text(
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  "1.MODÜL SINAVI",
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Text("Daha sonra düzenlenecek...")));
                },
                child: const Text(
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  "2.MODÜL SINAVI",
                )),
          ],
        ),
      ),
    );
  }
}
