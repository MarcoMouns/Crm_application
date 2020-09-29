import 'dart:convert';

import 'package:Crm_application/constants/api_constants.dart';
import 'package:Crm_application/model/data_hosting.dart';
import 'package:http/http.dart' as http;

class ServiceHostingSuresi {
  Future<DataModeHostingSuresi> fetchData() async {
    final http.Response response =
        await http.get(Uri.encodeFull(ApiConstants.HOSTING), headers: {
      "Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}",
    });
    if(response.statusCode==200){
      final _jsonResponse = DataModeHostingSuresi.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    }
    else{
      throw Exception("istek durumu başarısız oldu ${response.statusCode}");
    }
  }
}
