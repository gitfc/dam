import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class GestionarNiveles extends StatefulWidget {
  GestionarNiveles({Key? key}) : super(key: key);

  @override
  State<GestionarNiveles> createState() => _GestionarNivelesState();
}

class _GestionarNivelesState extends State<GestionarNiveles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('Gestionar niveles', context, false),
      body: Text('nivel'),
    );
  }
}
