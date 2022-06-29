import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/api.dart';
import '../providers/ruteo.dart';
import '../widgets/appbar.dart';
import 'gestionar_tias_nuevo.dart';

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
      body: Padding(
        padding: EdgeInsets.all(2),
        child: FutureBuilder(
          future: JardinProvider().getTable("tia"),
          builder: (context, AsyncSnapshot snap) {
            if (!snap.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ReorderableListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemBuilder: (context, i) {
                var tia = snap.data[i];
                return ListTile(
                  key: Key("${tia["rut"]}"),
                  title: Text("${tia["nombre"]}"),
                  tileColor: i.isOdd ? Color(0xFFE1FFAC) : Color(0xFFCCFFC7),
                  subtitle: Text(
                      "RUT: ${formatearRut(tia["rut"])}\nTía en ${tia["cursos"]} ${tia["cursos"] == 1 ? 'curso' : 'cursos'}"),
                  leading: Icon(MdiIcons.faceWomanProfile),
                  isThreeLine: true,
                );
              },
              itemCount: snap.data.length,
              onReorder: (int oldIndex, int newIndex) {
                null;
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => GestionarTiasNuevo(),
          );
          Navigator.push(context, route);
        },
        backgroundColor: Colors.red,
        child: Icon(MdiIcons.plusBox),
      ),
    );
  }
}
