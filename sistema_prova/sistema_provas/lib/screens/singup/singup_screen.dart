import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sistema_provas/routes/user_model.dart';

import '../../util/validated.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  UserModel userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 32),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 300,
                ),
              ),
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                      key: formKey,
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        shrinkWrap: true,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Nome Completo',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 4, 125, 141), width: 2.0),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            validator: (name) {
                              if (name!.isEmpty) {
                                return 'Campo obrigatório';
                              } else if (name.trim().split(' ').length <= 1) {
                                return 'Preencha seu Nome completo';
                              }
                              return null;
                            },
                            onSaved: (name) => userModel.name = name,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'E-mail',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 4, 125, 141), width: 2.0),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'Campo obrigatório';
                              } else if (!emailValid(email)) {
                                return 'E-mail inválido';
                              }
                              return null;
                            },
                            onSaved: (email) => userModel.email = email,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Senha',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 4, 125, 141), width: 2.0),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (pass) {
                              if (pass!.isEmpty) {
                                return 'Campo obrigatório';
                              } else if (pass.length < 6) {
                                return 'Senha muito curta';
                              }
                              return null;
                            },
                            onSaved: (pass) => userModel.password = pass,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Repita a Senha',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 4, 125, 141), width: 2.0),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (pass) {
                              if (pass!.isEmpty) {
                                return 'Campo obrigatório';
                              } else if (pass.length < 6) {
                                return 'Senha muito curta';
                              }
                              return null;
                            },
                            onSaved: (pass) => userModel.confirmPassword = pass,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();

                                  if (userModel.password != userModel.confirmPassword) {
                                    Fluttertoast.showToast(
                                        msg: "Senhas não coincidem!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);

                                    return;
                                  }

                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text(
                                'Criar Conta',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
