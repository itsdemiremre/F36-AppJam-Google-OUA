import 'package:flutter/material.dart';
import 'components/my_button.dart';
import 'components/my_textfield.dart';
import 'components/color_and_space.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsWhite(),
      appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: colorsBlack(),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
        backgroundColor: colorsWhite(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              spaceLarge(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hoşgeldiniz!',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          spaceMedium(),
                          const Text(
                            'Hemen giriş yap, rakiplerini geride bırak!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    spaceSmallWidth(),
                    Image.asset('lib/images/laptop.png',
                    height: 300,
                    width: 150,
                    ),
                  ],
                ),
              ),
              spaceLarge(),
              MyTextField(
                controller: emailController,
                hintText: 'E-mail', obscureText: false,
              ),
              spaceLarge(),
              MyTextField(
                controller: passwordController,
                hintText: 'Şifre',
                obscureText: true,
               ),
              spaceSmall(),
              Padding(
                 padding: EdgeInsets.symmetric(horizontal: 25.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                    Text(
                      'Şifreni mi unuttun?',
                      style: TextStyle(
                        color: colorsBlue(),
                      ),
                    ),
                  ],
                ),
              ),
              spaceLarge(),
              MyButton(
                text: 'Giriş',
                onTab: () {  },
              ),
              spaceLarge(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: colorsGrey(),
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Veya'),
                    ),
                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: colorsGrey(),
                    )),
                  ],
                ),
              ),
              spaceLarge(),
              Image.asset('lib/images/google.png',
              height: 30,
              ),
              spaceLarge(),
            ],
          ),
        ),
      ),
    );
  }
}