import 'dart:convert';

import 'package:Crm_application/constants/api_constants.dart';
import 'package:Crm_application/model/data_hostingler.dart';
import 'package:http/http.dart' as http;

class ServiceHostingler {
  Future<DataModelHostingler> fetchData() async {
    final http.Response response = await http.get(
      Uri.encodeFull(ApiConstants.HOSTINGLER),
      headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"},
    );
    if (response.statusCode == 200) {
      final _jsonResponse =
          DataModelHostingler.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    }
  }
}
