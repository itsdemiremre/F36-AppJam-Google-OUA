import 'package:flutter/material.dart';

class FlutterBirinciModul extends StatefulWidget {
 // const FlutterBirinciModul({super.key});

  @override
  State<FlutterBirinciModul> createState() => _FlutterBirinciModulState();
}

class _FlutterBirinciModulState extends State<FlutterBirinciModul> {

  List<BirinciModulSorular> soruListesi = SorulariAl();
  int mevcutSoruIndexi = 0;
  int puan = 0;
  BirinciModulCevaplar? seciliCevap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _soruWidgeti(),
            _cevapListesi(),
            _sonrakiButonu(),
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          shadowColor: Colors.black.withOpacity(0.25),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ]
              ),
            ),
          ),
          title: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "1.MODÜL SINAVI",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
              ],
            ),
          )
      )
    );
  }
  _soruWidgeti(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Soru ${mevcutSoruIndexi+1}/${soruListesi.length.toString()}"
        ),
        const SizedBox(height: 20,),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            soruListesi[mevcutSoruIndexi].soruMetni,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        )
      ],
    );
  }
  _cevapListesi(){
    return Column(
      children: [Column(
        children: soruListesi[mevcutSoruIndexi].cevapListesi.map((cevap) {
          return _cevapButonu(cevap);
        }).toList(),
      ),
      ]
    );
  }
  Widget _cevapButonu(BirinciModulCevaplar cevap){
    bool seciliMi = cevap==seciliCevap;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(
          cevap.cevapMetni,
          style: TextStyle(
            color: seciliMi? Colors.white:Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: seciliMi? Colors.indigo: Colors.lightBlueAccent,
        ),
        onPressed: (){
          if (seciliCevap == null){
            if(cevap.dogruMu){
              puan=puan+25;
            }
          }
          setState(() {
            seciliCevap = cevap;
          });
        },
      ),
    );
  }
  _sonrakiButonu(){
    bool sonSoruMu = false;
    if(mevcutSoruIndexi==soruListesi.length-1){
      sonSoruMu = true;
    }
    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(
          sonSoruMu?"Sonuçları Al":"Sonraki Soru",
          style: TextStyle(
            color:Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.lightBlueAccent,
        ),
        onPressed: (){
          if(sonSoruMu){
            showDialog(context: context, builder: (_) => _SonucEkraniGoster());
          }
          else{
            setState(() {
              seciliCevap = null;
              mevcutSoruIndexi++;
            });
          }
        }
      ),
    );
  }
  _SonucEkraniGoster(){
    bool gectiMi = false;
    if(puan >= 75){
      gectiMi = true;
    }
    String baslik = gectiMi? "Tebrikler, modülü başarıyla tamamladınız.":"Maalesef modülü başarıyla tamamlayamadınız.";
    return AlertDialog(
      title: Text( baslik + " | Puanınız: $puan",
       style: TextStyle(
        color: gectiMi? Colors.green:Colors.red,
       ),
      ),
      content: ElevatedButton(
        child: const Text(
          "Tekrar Deneyin."
        ),
        onPressed: (){
          Navigator.pop(context);
          setState((){
            mevcutSoruIndexi = 0;
            puan = 0;
            seciliCevap = null;
          });
        },
      ),
    );
  }
}

class BirinciModulSorular {
  final String soruMetni;
  final List<BirinciModulCevaplar> cevapListesi;
  BirinciModulSorular(this.soruMetni, this.cevapListesi);
}
class BirinciModulCevaplar {
  final String cevapMetni;
  final bool dogruMu;
  BirinciModulCevaplar(this.cevapMetni, this.dogruMu);
}
List<BirinciModulSorular> SorulariAl(){
  List<BirinciModulSorular> liste = [];
  liste.add(
    BirinciModulSorular("Android Studio'da uygulamayı çalıştırmak için kullandığımız run ve debug butonları arasındaki fark nedir?",
        [
          BirinciModulCevaplar("Run ile çalıştırdığımızda uygulama daha hızlı çalışır.", false),
          BirinciModulCevaplar("Debug ile çalıştırmak breakpoint'lerde durmamızı sağlar.",true),
          BirinciModulCevaplar("Run ile çalıştrmak breakpoint'lerde durmamızı sağlar.",false),
          BirinciModulCevaplar("İkisi arasında hiçbir fark yoktur.",false),
        ])
  );
  liste.add(
      BirinciModulSorular("Seçeneklerden hangisi doğru değildir?",
          [
            BirinciModulCevaplar("Flutter Inspector, kodumuzun bir özetini gösterir.", true),
            BirinciModulCevaplar("Hot reload, hot restart'tan daha hızlı çalışan bir özelliktir.",false),
            BirinciModulCevaplar("MaterialApp bir Widget classıdır.",false),
            BirinciModulCevaplar("Hot reload çalıştığında kodmuzun en güncel hali kullanılır.",false),
          ])
  );
  liste.add(
      BirinciModulSorular("Flutter Inspector ile hangisini yapamayız?",
          [
            BirinciModulCevaplar("Çalışmakta olan uygulamadan bir widget'a ekrandan dokunarak o widget'a ait koda gidebiliriz.", false),
            BirinciModulCevaplar("Uygulamamızın detaylı bir ağaç görünümüne ulaşabiliriz ve kullanılan tüm widgetları buradan görebiliriz.",false),
            BirinciModulCevaplar("Seçilen bir widget'ın ekrandaki konumlandırılmasını görebiliriz.",false),
            BirinciModulCevaplar("Kodumuza ait detayları görüntüleyebiliriz.",true),
          ])
  );
  liste.add(
      BirinciModulSorular("Seçeneklerden hangisi doğrudur?",
          [
            BirinciModulCevaplar("AppBar, uygulamanın alt tarafında bulunan ve navigasyon amacıyla kullandığımız widget'tır.", false),
            BirinciModulCevaplar("AppBar widget'ını Container içerisindeki appBar parametresine veririz.",false),
            BirinciModulCevaplar("Scaffold tüm ekranı kaplayan bir widget'tır.",false),
            BirinciModulCevaplar("Icon widget'ı üzerine basılabilir bir widget'tır yani buton görevi görür.",true),
          ])
  );
  return liste;
}
