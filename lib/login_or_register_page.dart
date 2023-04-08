import 'package:f36_appjam_project/register_page.dart';
import 'package:flutter/material.dart';
import 'package:f36_appjam_project/register_page.dart';
import 'login_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(
      onTab: togglePages,
      );
    }else{
      return RegisterPage(
        onTab: togglePages);
    }
  }
}