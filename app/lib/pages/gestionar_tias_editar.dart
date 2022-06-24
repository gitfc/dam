import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/api.dart';
import '../widgets/appbar.dart';

class GestionarTiasEditar extends StatefulWidget {
  GestionarTiasEditar({Key? key}) : super(key: key);

  @override
  State<GestionarTiasEditar> createState() => _GestionarTiasEditarState();
}

class _GestionarTiasEditarState extends State<GestionarTiasEditar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('Gestionar niveles', context, false),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: null,
      ),
    );
  }
}
