import 'package:f36_appjam_project/auth_page.dart';
import 'package:flutter/material.dart';

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
              color: Colors.blue,
              child: PageView(
                controller: controller,
                children: [
                  Container(
                    color: colorsWhite(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('lib/images/start1.jpg'),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Center(
                            child: Text('Akademi bursiyerleri ile yarış ve seviyeni herkese göster!',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
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
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 196, 248, 39), // Butonun arka plan rengi
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
                    color: colorsWhite(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('lib/images/start1.jpg'),
                        Text('Sayfa 3'),
                        spaceLarge(),
                        ElevatedButton(
                          onPressed: () => _goToAuthPage(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorsBlue(),
                            elevation: 20
                          ),
                          child: Text('Başlayalım'),
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