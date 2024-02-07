import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:flutter/cupertino.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    if (_isLogin) {
      return LoginPage(onTap: () {
        setState(() {
          _isLogin = false;
        });
      });
    } else {
      return RegisterPage(onTap: () {
        setState(() {
          _isLogin = true;
        });
      });
    }
  }
}
