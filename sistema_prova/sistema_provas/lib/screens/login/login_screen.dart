
import 'package:flutter/material.dart';
import 'package:sistema_provas/screens/login/components/body_login.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;


    final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
         actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/signup');
            },
           
            child: const Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 14,color: Colors.white,),
            ),
          )
        ],
      
      ),
      
      body: const BodyLogin(),
      
  
    );
  }
}
