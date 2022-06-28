import 'package:app/providers/ruteo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/api.dart';
import '../widgets/appbar.dart';

class GestionarEventosNuevo extends StatefulWidget {
  GestionarEventosNuevo({Key? key}) : super(key: key);

  @override
  State<GestionarEventosNuevo> createState() => GestionarEventosNuevoState();
}

class GestionarEventosNuevoState extends State<GestionarEventosNuevo> {
  TextEditingController descripcionCtrl = TextEditingController();
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController fechaCtrl = TextEditingController();
  DateTime fechaEvento = DateTime.now();
  int rut = 0;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fechaCtrl.text = DateFormat("yyyy-MM-dd").format(fechaEvento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('Agregar nuevo evento', context, false),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Form(
          child: ListView(
            children: [
              /*TextFormField(
                controller: rutCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "RUT",
                  prefixIcon: Icon(MdiIcons.idCard),
                ),
              ),*/
              FutureBuilder(
                future: JardinProvider().getTable("nino"),
                builder: (context, AsyncSnapshot snap) {
                  if (!snap.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return DropdownButtonFormField<String>(
                    hint: Text("Niño"),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                    ),
                    items: snap.data.map<DropdownMenuItem<String>>((nino) {
                      return DropdownMenuItem<String>(
                        child: Text(
                            "${nino['nombre']} (${formatearRut(nino['rut'])})"),
                        value: nino['rut'].toString(),
                      );
                    }).toList(),
                    onChanged: (nuevoValor) {
                      setState(() {
                        rut = int.parse(nuevoValor!);
                      });
                    },
                  );
                },
              ),
              TextFormField(
                controller: descripcionCtrl,
                decoration: InputDecoration(
                  labelText: "Descripción",
                  prefixIcon: Icon(MdiIcons.text),
                ),
                minLines: 5,
                maxLines: 10,
              ),
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: fechaEvento,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    locale: Locale('es', 'ES'),
                  ).then(
                    (fecha) {
                      fechaCtrl.text = DateFormat("yyyy-MM-dd").format(fecha!);
                      fechaEvento = fecha;
                    },
                  );
                },
                child: TextFormField(
                  enabled: false,
                  controller: fechaCtrl,
                  decoration: InputDecoration(
                    labelText: "Fecha",
                    prefixIcon: Icon(MdiIcons.calendar),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  var respuesta = await JardinProvider().agregarEvento(
                    rut,
                    descripcionCtrl.text.trim(),
                    fechaCtrl.text.trim().replaceAll(RegExp(r'-'), ''),
                  );

                  if (respuesta['message'] != null) {
                    print(respuesta);
                    return;
                  }

                  Navigator.pop(context);
                },
                child: Text(
                  'Agregar evento',
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
