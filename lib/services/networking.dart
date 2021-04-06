import 'package:http/http.dart' as http;
import 'dart:convert';
import 'APIResponseModel.dart';
import 'package:coronavirus_tracker_ph/services/network_response.dart';

class NetworkHelper {
  NetworkHelper();

  static const String ph_url =
      'https://api.covid19api.com/live/country/philippines';

  Uri url = Uri.parse(ph_url);
  Future<NetworkResponse> getData() async {
    try {
      http.Response response = await http.get(url);

      String data = response.body;

      var decodedData = jsonDecode(data);

      APIResponseModel apiResponseModel =
          APIResponseModel.fromJson(decodedData);

      return NetworkingResponseData(apiResponseModel);
    } catch (exception) {
      return NetworkingError(exception.toString());
    }
  }
}
