import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/color_and_space.dart';
import 'components/my_button.dart';
import 'components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTab;
  const RegisterPage({super.key, required this.onTab});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void signUserUp()async {

    showDialog(
      context: context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      );

    try {
      if(passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    }else{
      showErrorMessage("Passwords don't match!");
    }
    Navigator.pop(context);
    }on FirebaseAuthException catch (e) {
       Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }
  void showErrorMessage(String message){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text(
              message,
            style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    
    );
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
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
              spaceMedium(),
              MyTextField(
                controller: emailController,
                hintText: 'E-mail', obscureText: false,
              ),
              spaceMedium(),
              MyTextField(
                controller: passwordController,
                hintText: 'Şifre',
                obscureText: true,
               ),
              spaceMedium(),
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Şifreyi onayla',
                obscureText: true,
               ),
              spaceMedium(),
              MyButton(
                text: 'Kayıt Ol',
                onTab: signUserUp,
              ),
              spaceMedium(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: colorsBlack(),
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Veya'),
                    ),
                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: colorsBlack(),
                    )),
                  ],
                ),
              ),
              spaceMedium(),
              Image.asset('lib/images/google.png',
              height: 30,
              ),
              spaceMedium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Hesabınız var mı?',
                  style: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                  ),
                  const SizedBox(width: 4,),
                  GestureDetector(
                    onTap: widget.onTab,
                    child: const Text('Giriş yap.',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ],
              ),
              spaceMedium()
            ],
          )
        ),
      ),
    );
  }
}