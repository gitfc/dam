import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/api.dart';
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
      appBar: barra('Gestionar eventos', context, false),
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: CustomScrollView(
          slivers: [
            FutureBuilder(
              future: JardinProvider().getTable("evento"),
              builder: (context, AsyncSnapshot snap) {
                var children = 0;
                if (snap.connectionState != ConnectionState.done ||
                    !snap.hasData) {
                  children = 1;
                } else {
                  children = snap.data.length;
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Card(
                      margin: EdgeInsets.all(5),
                      color: Color.fromARGB(255, 255, 207, 223),
                      child: ListTile(
                        title: snap.hasData
                            ? eventoFormat(
                                snap.data[index]["fecha"].toString(),
                                snap.data[index]["descripcion"],
                                snap.data[index]["rut_nino"].toString())
                            : CircularProgressIndicator(),
                        trailing: Icon(
                          MdiIcons.fileEdit,
                        ),
                      ),
                    ),
                    childCount: children,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  eventoFormat(String fecha, String descripcion, String rut) {
    DateTime ff = DateTime.parse(fecha);
    String texto = ff.day.toString() +
        "/" +
        ff.month.toString() +
        "/" +
        ff.year.toString() +
        ": " +
        descripcion +
        "\nAlumno: " +
        rut.substring(0, rut.length - 1) +
        "-" +
        rut.substring(rut.length - 1);
    return Text(texto);
  }
}
