import 'endpoints.dart';

class PostRequestParams {
  final Map<String, dynamic> requestBody;
  final Endpoints endPoint;

  PostRequestParams({
    required this.requestBody,
    required this.endPoint,
  });
}
