import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class GestionarTias extends StatefulWidget {
  GestionarTias({Key? key}) : super(key: key);

  @override
  State<GestionarTias> createState() => _GestionarTiasState();
}

class _GestionarTiasState extends State<GestionarTias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('Gestionar tías', context, false),
      body: Text('educadoras'),
    );
  }
}
