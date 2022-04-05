import 'package:avaliacaonatan/tela_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  String _email = "";
  String _senha = "";
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        padding: EdgeInsets.all(25),
        child: Column(children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Senha',
            ),
            onChanged: (value) {
              setState(() {
                _senha = value.trim();
              });
            },
          ),
          TextButton(
              onPressed: () {
                auth.createUserWithEmailAndPassword(
                    email: _email, password: _senha);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => TelaLogin()));
              },
              child: const Text('Cadastrar')),
        ]),
      )),
    );
  }
}
