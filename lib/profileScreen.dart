import 'package:f36_appjam_project/costum_drawer.dart';
import 'package:flutter/material.dart';

class profileScreen extends StatefulWidget {
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        shadowColor: Colors.black.withOpacity(0.25),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
        ),

        title: Align(
          alignment: Alignment.centerRight,
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "Murat AVCI",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                Text(
                  "554 Puan",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 14.0),
                )
              ],
            ),

        ),
        actions: [
          Padding(padding:
          const EdgeInsets.only(left: 0, right: 18.0),
            child: new CircleAvatar(
              backgroundImage:  AssetImage('lib/images/profilepicture.png'),
            ),
          )
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.black,),
            );
          },
        ),
      ),
      drawer: CostumDrawer(),
      body: SingleChildScrollView(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right:16, bottom: 8, top: 20),
              child:
                Text('Oyun ve Uygulama Geliştirme Eğitimleri',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
            ),// Text
            _kartItem(kartIcon: Icons.developer_mode_outlined, kartTitle: 'Flutter ile Uygulama Geliştirme', kartYuzde: 0.75),
            _kartItem(kartIcon: Icons.developer_mode_outlined, kartTitle: 'Flutter ile Geliştirme Çalışmaları', kartYuzde: 0.18),
            _kartItem(kartIcon: Icons.gamepad_outlined, kartTitle: 'Unity ile Oyun Geliştirme', kartYuzde: 0.08),
            _kartItem(kartIcon: Icons.architecture, kartTitle: 'Oyun Sanatı', kartYuzde: 0.02),
            Container(
              margin: EdgeInsets.only(left: 16, right:16, bottom: 8, top: 8),
              child:
                Text('Teknoloji Girişimciliği  Eğitimleri',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
            ), //Text
            _kartItem(kartIcon: Icons.lightbulb_outlined, kartTitle: 'Girişimcilik Eğitimleri', kartYuzde: 1.0),
            _kartItem(kartIcon: Icons.psychology_outlined, kartTitle: 'Finans Eğitimleri', kartYuzde: 1.0),
            _kartItem(kartIcon: Icons.person_outline, kartTitle: 'İnsan Kaynakları Eğitimleri', kartYuzde: 1.0),
            _kartItem(kartIcon: Icons.gavel, kartTitle: 'Hukuk Eğitimleri', kartYuzde: 1.0),
          ],
      ),
      ),
    );

  }
  Container _kartItem(
      {required IconData kartIcon,
      required String kartTitle,
      required double kartYuzde}) =>
      Container(
        margin: EdgeInsets.only(left: 16, right:16, bottom: 8, top: 8),
        decoration: BoxDecoration(
          color: Color(0xFFF8F8F8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4.0,
            ),
          ],
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.all(16),
        constraints: const BoxConstraints(
          maxWidth: 360,
          maxHeight: 80,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              kartIcon,
              color: Colors.blue,
              size: 45,
            ),
            Text(
              kartTitle,
              style: TextStyle(fontSize: 16),
            ),
            CircularProgressIndicator(
              value: kartYuzde,
              strokeWidth: 8,
              color: Colors.blue,
              backgroundColor: Colors.amberAccent,
            ),
          ],
        ),
      );
}
