import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  Future getData() async {
    const String url = 'https://api.quarantine.country/api/v1/summary/latest';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
