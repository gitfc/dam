import 'package:app/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'gestionar_ninos.dart';
import 'gestionar_niveles.dart';
import 'gestionar_tias.dart';
import 'login_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('Bienvenido/a, (usuario)', context, true),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          padding: EdgeInsets.all(5),
          children: [
            GestureDetector(
              child: ListTile(
                trailing: Icon(MdiIcons.humanChild),
                title: Text('Gestionar niños'),
                subtitle:
                    Text('Actualizar información de cada niño del jardín'),
              ),
              onTap: () {
                irA(context, GestionarNinos());
              },
            ),
            GestureDetector(
              child: ListTile(
                trailing: Icon(MdiIcons.ruler),
                title: Text('Gestionar niveles'),
                subtitle: Text(
                    'Actualizar información de los diferentes niveles que tiene el jardín'),
              ),
              onTap: () {
                irA(context, GestionarNiveles());
              },
            ),
            GestureDetector(
              child: ListTile(
                trailing: Icon(MdiIcons.accountChild),
                title: Text('Gestionar educadoras'),
                subtitle: Text(
                    'Actualizar información de las educadoras que trabajan en el jardín'),
              ),
              onTap: () {
                irA(context, GestionarTias());
              },
            ),
            GestureDetector(
              child: ListTile(
                trailing: Icon(MdiIcons.logoutVariant),
                title: Text('Cerrar sesión'),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => LoginPage(),
                );
                Navigator.pushReplacement(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }

  void irA(BuildContext context, Widget seccion) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => seccion,
    );
    Navigator.push(context, route);
  }
}
