import 'endpoints.dart';

class GetRequestParams {
  final Map<String, dynamic> requestParameters;
  final Endpoints endPoint;

  GetRequestParams({
    required this.requestParameters,
    required this.endPoint,
  });
}
