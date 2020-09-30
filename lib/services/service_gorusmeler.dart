import 'dart:convert';

import 'package:Crm_application/constants/api_constants.dart';
import 'package:Crm_application/model/data_devameden_projetipi.dart';
import 'package:Crm_application/model/data_gorusmeler.dart';
import 'package:http/http.dart' as http;

class ServiceGorusmeler{
  Future<DataModelGorusmeler> fetchData() async{
    final http.Response response = await http.get(Uri.encodeFull(ApiConstants.GORUSMELER),headers: {
      "Authorization": "${ApiConstants.TOKEN_VALUE}"
    });
    if(response.statusCode==200)
      {
        final _jsonResponse = DataModelGorusmeler.fromJson(jsonDecode(response.body));
        return _jsonResponse;
      }else{
      throw Exception("istek durumu başarısız oldu${response.statusCode}");
    }
  }
}