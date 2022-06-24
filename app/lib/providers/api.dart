import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';

class JardinProvider {
  final String api = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getTable(String table) async {
    var uri = Uri.parse('$api/$table');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> getData(
      String table, String id) async {
    var uri = Uri.parse('$api/$table/$id');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> agregarNino(String rut, String nombre,
      String apoderado, String telefono, String id_nivel, String foto) async {
    var uri = Uri.parse('$api/nino');
    var respuesta = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(
        <String, dynamic>{
          'rut': int.tryParse(rut),
          'nombre': nombre,
          'foto': null,
          'nombre_apoderado': apoderado,
          'telefono_emergencia': int.tryParse(telefono),
          'id_nivel': int.tryParse(id_nivel),
        },
      ),
    );

    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> editarNino(int rut, String nombre,
      String apoderado, String telefono, String id_nivel, String foto) async {
    var uri = Uri.parse('$api/nino/$rut');
    var respuesta = await http.put(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(
        <String, dynamic>{
          'rut': rut,
          'nombre': nombre,
          'nombre_apoderado': apoderado,
          'telefono_emergencia': int.tryParse(telefono),
          'id_nivel': int.tryParse(id_nivel),
        },
      ),
    );

    return json.decode(respuesta.body);
  }

  Future<bool> borrarNino(int rut) async {
    var uri = Uri.parse('$api/nino/$rut');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
