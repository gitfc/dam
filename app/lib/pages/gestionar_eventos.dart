import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class GestionarEventos extends StatefulWidget {
  GestionarEventos({Key? key}) : super(key: key);

  @override
  State<GestionarEventos> createState() => _GestionarEventosState();
}

class _GestionarEventosState extends State<GestionarEventos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('Historial de eventos', context, false),
      body: Text('ev'),
    );
  }
}
