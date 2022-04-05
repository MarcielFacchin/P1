import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:avaliacaonatan/tela_cadastro.dart';
import 'package:avaliacaonatan/tela_login.dart';
import 'package:avaliacaonatan/tela_principal.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => MyApp(),
        '/cadastro': (BuildContext context) => TelaCadastro(),
        '/principal': (BuildContext context) => TelaPrincipal(),
      },
    );
  }
}
