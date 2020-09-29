import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/data_gorevler.dart';
import '../constants/api_constants.dart';

class ServiceGorevler {
  Future<DataModelGorevler> fetchData() async {

    /// burada [await] ile [http.get] nesnesinin çalışmasını bekleyip
    /// [response] değişkenine attık
    final http.Response response = await http.get(
      /// [Uri.encodeFull] ile adreste çıkabilecek (!#$&'()*+,-./:;=?@_~)
      /// gibi karakter hatalarının önüne geçiyoruz.
      Uri.encodeFull(ApiConstants.GOREVLER),

      headers: {
        "Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}",
      },
    );

    if (response.statusCode == 200) {
      ///  [fetchGets()] yöntemi [ApiConstants.BASE_URL]‘de tanımlanan
      /// API endpoint’i çağırdık ve response.body içinde JSON string aldık.
      /// Şimdide conversion yapabilmesi için [getsFromJson()]’a gönderiyoruz.
      /// [getsFromJson()] fonksiyonu nereden geldi?
      /// Model Sınıfımızın içerisinde bulunan sitenin [JsonToDart: https://app.quicktype.io/]
      /// bizim için [sinifAdiFromJson] şeklinde fonksiyonu otomatik oluşturur.

      //print(response.body);
      //return dataFromJson(response.body);

      /// Yukarıdaki metodu kullanmak istemezsen aşağıdakini kullanabilirsin
      /// Bunu kullanırsan ilk satıra import 'dart:convert'; yapmayı unutma
      final _jsonResponse = DataModelGorevler.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.statusCode}",
      );
    }
  }
}
