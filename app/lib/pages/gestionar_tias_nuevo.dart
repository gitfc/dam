import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/api.dart';
import '../widgets/appbar.dart';

class GestionarTiasNuevo extends StatefulWidget {
  GestionarTiasNuevo({Key? key}) : super(key: key);

  @override
  State<GestionarTiasNuevo> createState() => _GestionarTiasNuevoState();
}

class _GestionarTiasNuevoState extends State<GestionarTiasNuevo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('Agregar nueva tía', context, false),
      body: Container(),
    );
  }
}
