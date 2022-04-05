import 'package:avaliacaonatan/tela_principal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  String _email = "";
  String _senha = "";
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
                decoration: InputDecoration(
                    // hintText: "E-Mail",
                    labelText: "E-Mail"),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _senha = value.trim();
                  });
                },
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha"),
              ),
              ElevatedButton(
                  onPressed: () {
                    auth
                        .signInWithEmailAndPassword(
                            email: _email, password: _senha)
                        .then((_) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => TelaPrincipal()));
                    });
                    // Navigator.of(context).pushReplacementNamed('/principal');
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(400, 50)),
                  ),
                  child: Text("Login")),
              SizedBox(
                height: 15.00,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cadastro');
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(400, 50)),
                  ),
                  child: Text("Cadastrar")),
              SizedBox(
                height: 10.0,
              ),
              TextButton(onPressed: () {}, child: Text("Registrar-Se")),
              SizedBox(
                height: 10.0,
              ),
              TextButton(onPressed: () {}, child: Text("Recuperar Senha")),
              Text(_email),
              Text(_senha),
            ],
          ),
        ),
      ),
    );
  }
}
