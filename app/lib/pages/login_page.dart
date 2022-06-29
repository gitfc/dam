import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'menu_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión'),
        backgroundColor: Color.fromARGB(255, 255, 137, 176),
        leading: Icon(MdiIcons.login, color: Color.fromARGB(255, 184, 50, 41)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Jardín Infantil',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                controller: emailCtrl,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter(' ', allow: false),
                ],
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
            ),
            ElevatedButton(
              child: Text(
                'Entrar',
                style: TextStyle(fontSize: 18),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Color.fromARGB(255, 138, 19, 58);
                    return Colors.pink; // Use the component's default.
                  },
                ),
              ),
              onPressed: () async {
                UserCredential? cred;
                try {
                  cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailCtrl.text.trim().toLowerCase(),
                    password: passwordCtrl.text.trim(),
                  );

                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => MenuPage());

                  Navigator.pushReplacement(context, route);
                } on FirebaseAuthException catch (ex) {
                  error = 'Error: ';

                  switch (ex.code) {
                    case 'user-not-found':
                      error += 'Usuario no encontrado';
                      break;
                    case 'wrong-password':
                      error += 'Contraseña incorrecta';
                      break;
                    case 'user-disabled':
                      error += 'Usuario desactivado';
                      break;
                    case 'invalid-email':
                      error += 'Correo no válido';
                      break;
                    default:
                      if (emailCtrl.text.trim() == '') {
                        error += 'Por favor ingresa un correo';
                      } else if (passwordCtrl.text.trim() == '') {
                        error += 'Por favor ingresa una contraseña';
                      } else {
                        error += 'Error desconocido';
                      }
                  }

                  setState(() {});
                }
              },
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Text('Usuario: u@gmail.com\nContraseña: 123456'),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
