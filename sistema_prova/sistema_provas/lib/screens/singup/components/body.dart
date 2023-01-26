
import 'package:flutter/material.dart';
import 'package:sistema_provas/screens/login/login_screen.dart';
import 'package:sistema_provas/screens/singup/components/background.dart';
import 'package:sistema_provas/screens/singup/components/or_divider.dart';
import 'package:sistema_provas/screens/singup/components/social_icon.dart';
import 'package:sistema_provas/util/already_have_an_account.dart';
import 'package:sistema_provas/util/rounded_button.dart';
import 'package:sistema_provas/util/rounded_input_field.dart';
import 'package:sistema_provas/util/rounded_password_field.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32),
              child: Image.asset(
                "assets/images/image_login_register.png",
                height: size.height * 0.35,
              ),
            ),
               RoundedInputField(
              hintText: "Nome ",
              onChanged: (value) {},
            ), 
            RoundedInputField(
              hintText: "Seu e-mail",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Cadastrar",
              press: () {
                   Navigator.pushNamedAndRemoveUntil(context, '/homeScreen',(Route<dynamic> route) => false);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
            ),
          const  OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}