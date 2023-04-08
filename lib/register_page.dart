import 'package:flutter/material.dart';
import 'components/color_and_space.dart';
import 'components/my_button.dart';
import 'components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
                            'Hemen kayıt ol, yarışmaya başla!',
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
              spaceLarge(),
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Şifreyi onayla',
                obscureText: true,
               ),
              spaceLarge(),
              MyButton(
                text: 'Kayıt Ol',
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
          )
        ),
      ),
    );
  }
}