import 'dart:convert';

import 'package:app/providers/api.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/appbar.dart';
import 'login_page.dart';

class GestionarNinosForm extends StatefulWidget {
  final rut;
  final nombre;
  GestionarNinosForm({Key? key, this.rut, this.nombre}) : super(key: key);

  @override
  State<GestionarNinosForm> createState() => _GestionarNinosFormState();
}

class _GestionarNinosFormState extends State<GestionarNinosForm> {
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apoderadoCtrl = TextEditingController();
  TextEditingController telefonoCtrl = TextEditingController();
  String selected = "";
  final formKey = GlobalKey<FormState>();
  //int _stack = 0;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('${widget.nombre}', context, false),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: JardinProvider().getData("nino", "${widget.rut}"),
          builder: (context, AsyncSnapshot snap) {
            if (!snap.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var nino = snap.data;
            var rr = nino["rut"].toString();
            rutCtrl.text = rr.substring(0, rr.length - 1) +
                "-" +
                rr.substring(rr.length - 1);
            nombreCtrl.text = nino["nombre"];
            apoderadoCtrl.text = nino["nombre_apoderado"];
            telefonoCtrl.text = nino["telefono_emergencia"].toString();

            return Form(
              key: formKey,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      /*FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image);

                      if (result != null) {
                        ImageStream file = result.files as ImageStream;
                        //image = file as Image;
                        //_visible = true;
                        setState(() {});
                      }*/
                    },
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: nino["foto"].toString().isEmpty
                                    ? AssetImage('lib/img/non.jpg')
                                    : AssetImage('lib/img/non.jpg'),
                                //: MemoryImage(base64Decode("${nino["foto"]}")),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            alignment: Alignment.bottomLeft,
                            width: 250,
                            height: 250,
                          ),
                          AnimatedOpacity(
                            opacity: _visible ? 1 : 0,
                            duration: Duration(milliseconds: 600),
                            child: Container(
                              width: 250,
                              height: 250,
                              child: null,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              width: 30,
                              height: 30,
                              child: Icon(MdiIcons.camera),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*FocusScope(
                    onFocusChange: (value) {
                      rutCtrl.text =
                          rutCtrl.text.replaceFirst(RegExp(r"-"), "");
                      rutCtrl.text =
                          rutCtrl.text.substring(0, rutCtrl.text.length - 1) +
                              "-" +
                              rutCtrl.text.substring(rutCtrl.text.length - 1);
                    },
                    child:*/
                  TextFormField(
                    controller: rutCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "RUT",
                      prefixIcon: Icon(MdiIcons.idCard),
                    ),
                    enabled: false,
                  ),
                  /*),*/
                  TextFormField(
                    controller: nombreCtrl,
                    decoration: InputDecoration(
                      labelText: "Nombre",
                      prefixIcon: Icon(MdiIcons.humanChild),
                    ),
                    //enabled: false,
                  ),
                  TextFormField(
                    controller: apoderadoCtrl,
                    decoration: InputDecoration(
                      labelText: "Nombre de apoderado",
                      prefixIcon: Icon(MdiIcons.human),
                    ),
                    //enabled: false,
                  ),
                  TextFormField(
                    controller: telefonoCtrl,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Teléfono de emergencia",
                      prefixIcon: Icon(MdiIcons.phone),
                    ),
                    //enabled: false,
                  ),
                  FutureBuilder(
                    future: JardinProvider().getTable("nivel"),
                    builder: (context, AsyncSnapshot snap) {
                      if (!snap.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      String selected = "${nino["id_nivel"]}";
                      return DropdownButtonFormField<String>(
                        //key: nivelCtrl,
                        hint: Text("Nivel"),
                        items: snap.data.map<DropdownMenuItem<String>>((nivel) {
                          return DropdownMenuItem<String>(
                            child: Text(nivel['descripcion']),
                            value: nivel['id'].toString(),
                          );
                        }).toList(),
                        value: selected.isEmpty ? null : selected,
                        onChanged: (nuevoValor) {
                          setState(() {
                            selected = nuevoValor.toString();
                          });
                        },
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      JardinProvider().editarNino(
                        widget.rut,
                        nombreCtrl.text.trim(),
                        apoderadoCtrl.text.trim(),
                        telefonoCtrl.text.trim(),
                        selected.trim(),
                        "",
                      );
                    },
                    child: Text(
                      'Guardar cambios',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Color.fromARGB(255, 14, 62, 102);
                          return Colors.blue; // Use the component's default.
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      JardinProvider().borrarNino(widget.rut).then(
                        (borrado) {
                          /*if (borrado) {*/
                          Navigator.pop(context);
                          setState(() {});
                          /*} else {
                            print("error borrando");
                          }*/
                        },
                      );
                    },
                    child: Text(
                      'Eliminar niño',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Color.fromARGB(255, 128, 28, 21);
                          return Colors.red; // Use the component's default.
                        },
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          return Colors.white; // Use the component's default.
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
