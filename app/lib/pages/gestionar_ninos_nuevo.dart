import 'package:app/providers/api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/appbar.dart';

class GestionarNinosNuevo extends StatefulWidget {
  GestionarNinosNuevo({Key? key}) : super(key: key);

  @override
  State<GestionarNinosNuevo> createState() => _GestionarNinosNuevoState();
}

class _GestionarNinosNuevoState extends State<GestionarNinosNuevo> {
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apoderadoCtrl = TextEditingController();
  TextEditingController telefonoCtrl = TextEditingController();
  String selected = "";
  final formKey = GlobalKey<FormState>();
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
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.image);

                  if (result != null) {
                    ImageStream file = result.files as ImageStream;
                    //image = file as Image;
                    //_visible = true;
                    setState(() {});
                  }
                },
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/img/non.jpg'),
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
                  var respuesta = JardinProvider().agregarNino(
                    rutCtrl.text.trim(),
                    nombreCtrl.text.trim(),
                    apoderadoCtrl.text.trim(),
                    telefonoCtrl.text.trim(),
                    selected.trim(),
                    "",
                  );

                  if (respuesta != null) {
                    print("error");
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
}
