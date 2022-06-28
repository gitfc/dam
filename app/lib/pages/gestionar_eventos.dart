import 'package:app/providers/ruteo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/api.dart';
import '../widgets/appbar.dart';
import 'gestionar_eventos_nuevo.dart';

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
                            ? RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: DateFormat("yyyy-MM-dd")
                                          .format(snap.data[index]["fecha"]),
                                      // TODO
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                  style: TextStyle(color: Colors.black),
                                ),
                              )

                            /*eventoFormat(
                                snap.data[index]["fecha"].toString(),
                                snap.data[index]["descripcion"],
                                snap.data[index]["rut_nino"].toString())*/
                            : CircularProgressIndicator(),
                        trailing: Icon(MdiIcons.bookEdit),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(builder: (context) {
            return GestionarEventosNuevo();
          });
          Navigator.push(context, route).then((value) => setState(() {}));
        },
        backgroundColor: Colors.red,
        child: Icon(MdiIcons.file),
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
        formatearRut(int.parse(rut));
    return Text(texto);
  }
}
