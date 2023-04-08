import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/my_button.dart';
import 'components/my_textfield.dart';
import 'components/color_and_space.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTab;
   LoginPage({super.key, required this.onTab});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signUserIn()async {

    showDialog(
      context: context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    Navigator.pop(context);
    }on FirebaseAuthException catch (e) {
       Navigator.pop(context);
      if(e.code == 'user-not-found'){
        //show error to user
        wrongEmailMessage();
        
      }else if(e.code == 'wrong-password'){
        //show error to user
        wrongPasswordMessage();
        
      }
    }
  }
  void wrongEmailMessage(){
    showDialog(
      context: context,
      builder: (context){
        return const AlertDialog(
          backgroundColor: Colors.purple,
          title: Text('Incorrect Email',
          style: TextStyle(color: Colors.white),
          ),
        );
      }
    
    );
  }
  void wrongPasswordMessage(){
    showDialog(
      context: context,
      builder: (context){
        return const AlertDialog(
          backgroundColor: Colors.purple,
          title: Text('Incorrect Password',
          style: TextStyle(color: Colors.white),
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
            mainAxisAlignment: MainAxisAlignment.start,
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
              spaceMedium(),
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
              spaceMedium(),
              MyButton(
                text: 'Giriş',
                onTab: signUserIn,
              ),
              spaceMedium(),
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
              spaceMedium(),
              Image.asset('lib/images/google.png',
              height: 30,
              ),
              spaceMedium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Hesabınız yok mu?',
                  style: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                  ),
                  const SizedBox(width: 4,),
                  GestureDetector(
                    onTap: widget.onTab,
                    child: const Text('Kayıt ol',
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
          ),
        ),
      ),
    );
  }
}