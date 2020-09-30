import 'package:Crm_application/constants/api_constants.dart';
import 'package:Crm_application/model/data_projebazli_gorevler.dart';
import 'package:Crm_application/model/data_sektorbazli_demo.dart';
import 'package:Crm_application/model/data_tamamlanan_projetipi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceTamamlananProjeTipi {
  Future<DataModelTamamlananProjeTipi> fetchData() async {
    final http.Response response = await http.get(
        Uri.encodeFull(ApiConstants.TAMAMLANAN_PROJETIPI),
        headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"});
    if (response.statusCode == 200) {
      final _jsonResponse =
      DataModelTamamlananProjeTipi.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception(
        "istek durumu başarısız oldu ${response.statusCode}",
      );
    }
  }
}
