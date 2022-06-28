import 'package:intl/intl.dart';

String formatearRut(int rut) {
  NumberFormat numFormat = NumberFormat.decimalPattern('es_cl');
  String rutNino = rut.toString();
  String rutFormateado =
      numFormat.format(int.parse(rutNino.substring(0, rutNino.length - 1))) +
          "-" +
          rutNino.substring(rutNino.length - 1);
  return "${rutFormateado}";
}
