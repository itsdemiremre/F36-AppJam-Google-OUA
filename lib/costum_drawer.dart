import 'dart:ui';
import 'package:f36_appjam_project/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'profileScreen.dart';
import 'chat_screen.dart';
import 'sinavlar.dart';

void signUserOut(){
    FirebaseAuth.instance.signOut();
}

class CostumDrawer extends StatelessWidget {
  const CostumDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container (
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
            child: ListView(
              children:  [
                const DrawerHeader(
                  child: Image(image: AssetImage("assets/rankademyLogo.png"),),
                ),
                _drawerItem(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => homeScreen(),
                    ),
                  );
                }, iconData: Icons.home, title: 'Ana Sayfa'),
                _drawerItem(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profileScreen(),
                    ),
                  );
                }, iconData: Icons.person, title: 'Profilim'),
                _drawerItem(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                }, iconData: Icons.comment, title: 'Sohbetler'),
                _drawerItem(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DerslerAnaEkran(),
                    ),
                  );
                }, iconData: Icons.question_mark, title: 'Sınavlar'),
                const Divider(
                  color: Colors.black,
                  endIndent: 20,
                  indent: 20,
                ),
                _drawerItem(onTap: (){signUserOut();}, iconData: Icons.logout, title: 'Çıkış'),
              ],
            ),
          ),
    ),
    );

  }
  ListTile _drawerItem(
      {required VoidCallback onTap,
        required IconData iconData,
        required String title}) =>
      ListTile(
        onTap: onTap,
        leading: Icon(iconData, size: 38, color: Colors.blue,),
        title: Text(title, style: TextStyle(fontSize: 18),)
  );
}
