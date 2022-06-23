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
      body: FutureBuilder(
        future: JardinProvider().getData("nino"),
        builder: (context, AsyncSnapshot snap) {
          if (!snap.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              //childAspectRatio: 2.0,
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
                  child: Image(
                    image: AssetImage('lib/img/${nino["rut"]}.jpg'),
                  ),
                ),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
