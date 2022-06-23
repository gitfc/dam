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
}
