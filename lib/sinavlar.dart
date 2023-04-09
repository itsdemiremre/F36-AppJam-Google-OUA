import 'package:f36_appjam_project/sinavlar1.dart';
import 'package:flutter/material.dart';
import 'costum_drawer.dart';

class DerslerAnaEkran extends StatefulWidget {
  const DerslerAnaEkran({super.key});

  @override
  _DerslerAnaEkranState createState() => _DerslerAnaEkranState();
}

class _DerslerAnaEkranState extends State<DerslerAnaEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Sınavlar",
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ],
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            );
          },
        ),
      ),
      drawer: CostumDrawer(),
      body: const DersButonlari(),
    );
  }
}

class DersButonlari extends StatelessWidget {
  const DersButonlari({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        width: 400,
        height: 100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.indigoAccent,
              child: const Center(
                child: Text(
                  "Flutter ile Uygulama Geliştirme Sınavları",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              backgroundColor: Colors.indigoAccent,
              elevation: 15,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FlutterModuller(),
              ));
            },
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          )),
      SizedBox(
        width: 400,
        height: 100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: const Center(
                child: Text(
                  "Temel Girişimcilik Sınavları",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              backgroundColor: Colors.amber,
              elevation: 15,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Text("merhaba");
              }));
            },
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          )),
      SizedBox(
        width: 400,
        height: 100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.redAccent,
              child: const Center(
                child: Text(
                  "Girişimciler İçin Hukuk Sınavları",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              elevation: 15,
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Text("merhaba");
              }));
            },
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          )),
      SizedBox(
        width: 400,
        height: 100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  "Girişimciler İçin Finans Sınavları",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              elevation: 15,
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Text("merhaba");
              }));
            },
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          )),
    ]);
  }
}
