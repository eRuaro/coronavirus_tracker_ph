import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper();

  static const String ph_url = 'https://api.covid19api.com/live/country/philippines';

  Uri url = Uri.parse(ph_url);
  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      return decodedData;
    }
    else {
      print(response.statusCode);
    }
  }
}