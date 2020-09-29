import 'dart:convert';

import 'package:Crm_application/constants/api_constants.dart';
import 'package:http/http.dart' as http;

import 'package:Crm_application/model/data_onaylanan_musteriler.dart';

class ServiceOnaylananMusteriler {
  Future<DataModelOnaylananMusteriler> fetchData() async {
    final http.Response response = await http.get(
        Uri.encodeFull(ApiConstants.ONAYLANAN_MUSTERILER),
        headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"});
    if (response.statusCode == 200) {
      final _jsonResponse =
          DataModelOnaylananMusteriler.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception(
        "istek durumu başarısız oldu ${response.statusCode}",
      );
    }
  }
}
