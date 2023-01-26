import 'package:flutter/material.dart';
import 'package:sistema_provas/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Domínios de Softare',
      theme: ThemeData(
        primaryColor:const Color.fromARGB(255, 4, 125, 141),
        scaffoldBackgroundColor:const Color.fromARGB(255, 4, 125, 141),
        backgroundColor:const Color.fromARGB(255, 4, 125, 141),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Color.fromARGB(255, 4, 125, 141),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        
     );
  }
}