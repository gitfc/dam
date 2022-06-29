import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/api.dart';
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: JardinProvider().getTable("nivel"),
          builder: (context, AsyncSnapshot snap) {
            if (!snap.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ReorderableListView.builder(
              itemBuilder: (context, i) {
                var nivel = snap.data[i];
                return ListTile(
                  key: Key("${nivel["id"]}"),
                  title: Text("${nivel["descripcion"]}"),
                  subtitle: Text("Cursan ${nivel["ninos_cursando"]} niños"),
                  tileColor: i.isOdd ? Color(0xFFA09FE6) : Color(0xFFB8F4FF),
                  leading: Text(
                    "Nivel\n${nivel["id"]}",
                    textAlign: TextAlign.center,
                  ),
                  trailing: Icon(MdiIcons.spiritLevel),
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
          /*MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => GestionarNivelesNuevo(),
          );
          Navigator.push(context, route);*/
        },
        backgroundColor: Colors.red,
        child: Icon(MdiIcons.plus),
      ),
    );
  }
}
