import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/api.dart';
import '../providers/ruteo.dart';
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
        padding: EdgeInsets.all(5),
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
                    (context, index) {
                      if (snap.hasData) {
                        var evento = snap.data[index];
                        return Card(
                          margin: EdgeInsets.all(5),
                          color: Color.fromARGB(255, 255, 207, 223),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: evento["nombre"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' (${formatearRut(evento["rut_nino"])}) ',
                                  ),
                                  TextSpan(
                                    text: evento["fecha"]
                                            .toString()
                                            .substring(6) +
                                        "-" +
                                        evento["fecha"]
                                            .toString()
                                            .substring(4, 6) +
                                        "-" +
                                        evento["fecha"]
                                            .toString()
                                            .substring(0, 4) +
                                        ": ",
                                  ),
                                  TextSpan(
                                    text: evento["descripcion"],
                                  )
                                ],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                    childCount: children,
                  ),
                );
              },
            )
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
}
