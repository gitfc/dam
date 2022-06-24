import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/appbar.dart';

class GestionarEventosNuevo extends StatefulWidget {
  GestionarEventosNuevo({Key? key}) : super(key: key);

  @override
  State<GestionarEventosNuevo> createState() => GestionarEventosNuevoState();
}

class GestionarEventosNuevoState extends State<GestionarEventosNuevo> {
  TextEditingController descripcionCtrl = TextEditingController();
  TextEditingController rutCtrl = TextEditingController();
  DateTime fechaEvento = DateTime.now();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra('Agregar nuevo evento', context, false),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: rutCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "RUT",
                  prefixIcon: Icon(MdiIcons.idCard),
                ),
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
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        locale: Locale('es', 'ES'),
                      ).then((fecha) {
                        fechaEvento = fecha ?? fechaEvento;
                      });
                    },
                    child: Icon(MdiIcons.calendar),
                  ),
                  Expanded(
                    child: Text(
                      DateFormat("yyyy-MM-dd").format(fechaEvento),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
