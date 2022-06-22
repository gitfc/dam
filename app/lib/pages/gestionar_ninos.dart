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
      body: GridView.count(
        padding: EdgeInsets.all(5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
          20,
          (index) {
            return Center(
              child: Text(
                'Niño ${index + 1}',
              ),
            );
          },
        ),
      ),
    );
  }
}
