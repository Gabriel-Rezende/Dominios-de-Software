import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 6500), () {
         Navigator.pushNamedAndRemoveUntil(context, '/login',(Route<dynamic> route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.network("https://assets3.lottiefiles.com/packages/lf20_kyxinydn.json")
    );
  }
}