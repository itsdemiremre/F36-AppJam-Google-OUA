import 'package:f36_appjam_project/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/color_and_space.dart';
import 'components/my_button.dart';

class StartPage extends StatefulWidget {
  StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
final PageController controller = PageController(initialPage: 0);

void _goToAuthPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AuthPage()),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: colorsWhite(),
              child: PageView(
                controller: controller,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('lib/images/Software.svg',
                        width: 300,
                        height: 300,
                        ),
                        spaceMedium(),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Center(
                            child: Text('Akademi bursiyerlerine özel hazırladığımız sorularla eksiklerinizi görebilir ve gelişiminize katkıda bulanabilirsiniz!',
                            textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(250,74 ,74 ,74),
                                wordSpacing: 4.0,
                                height: 1.5 ,
                                fontSize: 26,
                                fontWeight: FontWeight.normal,
                              ),
                              ),
                          ),
                        ),
                        spaceLarge(),
                        ElevatedButton(
                          onPressed: () => controller.animateToPage(
                            1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          ),
                          child: Text(
                            'İleri',
                            style: TextStyle(
                              color: Color.fromARGB(250,74 ,74 ,74),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 242, 249, 15),
                            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 18.0), // Butonun iç boşluğu
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0), // Butonun kenar yuvarlatma değeri
                            ),
                            elevation: 5.0, // Butonun yükselik değeri
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('lib/images/people.svg',
                        width: 300,
                        height: 300,
                        ),
                        spaceMedium(),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Center(
                            child: Text('Rakiplerinizle yarışıp yazılım becerililerinizi geliştirebilir ve aynı zamanda onlarla tanışıp güzel dostluklar edinebilirsiniz!',
                            textAlign: TextAlign.center,
                              style: TextStyle(
                                color:Color.fromARGB(250,74 ,74 ,74),
                                wordSpacing: 4.0,
                                height: 1.5 ,
                                fontSize: 26,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        spaceLarge(),
                        ElevatedButton(
                          onPressed: () => _goToAuthPage(context),
                          child: Text(
                            'Başlayalım',
                            style: TextStyle(
                              color: Color.fromARGB(250,74 ,74 ,74),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 242, 249, 15), // Butonun arka plan rengi
                            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 18.0), // Butonun iç boşluğu
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0), // Butonun kenar yuvarlatma değeri
                            ),
                            elevation: 5.0, // Butonun yükselik değeri
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}