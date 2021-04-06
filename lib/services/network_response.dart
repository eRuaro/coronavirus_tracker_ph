import 'APIResponseModel.dart';

class NetworkResponse {}

class NetworkingError extends NetworkResponse {
  String message;
  NetworkingError(this.message);
}

class NetworkingResponseData extends NetworkResponse {
  APIResponseModel apiResponseModel;
  NetworkingResponseData(this.apiResponseModel);
}
