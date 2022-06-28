import 'dart:convert';
import 'dart:io';

import 'package:app/providers/api.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/image_provider.dart';
import '../widgets/appbar.dart';

class GestionarNinosNuevo extends StatefulWidget {
  GestionarNinosNuevo({Key? key}) : super(key: key);

  @override
  State<GestionarNinosNuevo> createState() => _GestionarNinosNuevoState();
}

class _GestionarNinosNuevoState extends State<GestionarNinosNuevo> {
  final formKey = GlobalKey<FormState>();
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apoderadoCtrl = TextEditingController();
  TextEditingController telefonoCtrl = TextEditingController();
  String selected = "";

  /*final picker = ImagePicker();
  final storageRef = FirebaseStorage.instance.ref();
  late File _imagen;*/
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('Agregar nuevo niño', context, false),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        child: Image.memory(
                          base64Decode(sinImagen64()),
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                          width: 250,
                          height: 250,
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
              ),
              /*),*/
              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(
                  labelText: "Nombre",
                  prefixIcon: Icon(MdiIcons.humanChild),
                ),
              ),
              TextFormField(
                controller: apoderadoCtrl,
                decoration: InputDecoration(
                  labelText: "Nombre de apoderado",
                  prefixIcon: Icon(MdiIcons.human),
                ),
              ),
              TextFormField(
                controller: telefonoCtrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Teléfono de emergencia",
                  prefixIcon: Icon(MdiIcons.phone),
                ),
              ),
              FutureBuilder(
                future: JardinProvider().getTable("nivel"),
                builder: (context, AsyncSnapshot snap) {
                  if (!snap.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return DropdownButtonFormField<String>(
                    hint: Text("Nivel"),
                    items: snap.data.map<DropdownMenuItem<String>>((nivel) {
                      return DropdownMenuItem<String>(
                        child: Text(nivel['descripcion']),
                        value: nivel['id'].toString(),
                      );
                    }).toList(),
                    onChanged: (nuevoValor) {
                      setState(() {
                        selected = nuevoValor.toString();
                      });
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  var respuesta = await JardinProvider().agregarNino(
                    int.tryParse(rutCtrl.text.trim()) ?? 0,
                    nombreCtrl.text.trim(),
                    apoderadoCtrl.text.trim(),
                    int.tryParse(telefonoCtrl.text.trim()) ?? 0,
                    int.parse(selected.trim()),
                    "",
                  );

                  if (respuesta['message'] != null) {
                    print(respuesta);
                    return;
                  }

                  Navigator.pop(context);
                },
                child: Text(
                  'Agregar niño',
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
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancelar',
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
        ),
      ),
    );
  }

  /*Future pickImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagen = File(image.path);
      });
    }
  }*/
}
