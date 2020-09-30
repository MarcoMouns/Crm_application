import 'package:Crm_application/constants/api_constants.dart';
import 'package:Crm_application/model/data_onaylanmayan_musteriler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Crm_application/model/data_onaylanan_projeler.dart';

class ServiceOnaylanmayanMusteriler {
  Future<DataModelOnaylanmayanMusteriler> fetchData() async {
    final http.Response response = await http.get(
        Uri.encodeFull(ApiConstants.ONAYLANMAYAN_MUSTERILER),
        headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"});
    if (response.statusCode == 200) {
      final _jsonResponse =
      DataModelOnaylanmayanMusteriler.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception(
        "istek durumu başarısız oldu ${response.statusCode}",
      );
    }
  }
}
