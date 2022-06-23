import 'package:app/pages/gestionar_ninos_form.dart';
import 'package:app/providers/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/appbar.dart';
import 'login_page.dart';

class GestionarNinos extends StatefulWidget {
  GestionarNinos({Key? key}) : super(key: key);

  @override
  State<GestionarNinos> createState() => _GestionarNinosState();
}

class _GestionarNinosState extends State<GestionarNinos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('Gestionar niños', context, false),
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: FutureBuilder(
          future: JardinProvider().getTable("nino"),
          builder: (context, AsyncSnapshot snap) {
            if (!snap.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1 / 1.3,
              ),
              itemCount: snap.data.length,
              itemBuilder: (context, i) {
                /*return ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 100),
                      ),
                    ),
                  );*/
                var nino = snap.data[i];
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/img/${nino["rut"]}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "${nino["nombre"]}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => GestionarNinosForm(
                        rut: "${nino["rut"]}",
                        nombre: "${nino["nombre"]}",
                      ),
                    );
                    Navigator.push(context, route);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
