import 'package:reqres/product/_product_exports.dart';

enum StatusCodes {
  statusCode200,
  statusCode201,
  statusCode204,
  statusCode400,
  statusCode401,
  statusCode403,
  statusCode404,
  statusCode417,
  statusCode500,
  statusCode504,
}

extension StatusCodeEnumsExtension on StatusCodes {
  static StatusCodes statusCodeToEnum(final int? statusCode) {
    switch (statusCode) {
      case 200:
        return StatusCodes.statusCode200;
      case 201:
        return StatusCodes.statusCode201;
      case 204:
        return StatusCodes.statusCode204;
      case 400:
        return StatusCodes.statusCode400;
      case 401:
        return StatusCodes.statusCode401;
      case 403:
        return StatusCodes.statusCode403;
      case 404:
        return StatusCodes.statusCode404;
      case 417:
        return StatusCodes.statusCode417;
      case 500:
        return StatusCodes.statusCode500;
      case 504:
        return StatusCodes.statusCode504;
      default:
        return StatusCodes.statusCode404;
    }
  }

  static Failure? stateToFailure(StatusCodes statusCode) {
    switch (statusCode) {
      case StatusCodes.statusCode400:
      case StatusCodes.statusCode401:
      case StatusCodes.statusCode403:
      case StatusCodes.statusCode404:
      case StatusCodes.statusCode417:
      case StatusCodes.statusCode500:
      case StatusCodes.statusCode504:
        return RequestFailure();
      case StatusCodes.statusCode200:
      case StatusCodes.statusCode204:
      case StatusCodes.statusCode201:
        return null;
    }
  }

  static bool isSuccess(StatusCodes statusCode) {
    switch (statusCode) {
      case StatusCodes.statusCode200:
      case StatusCodes.statusCode201:
      case StatusCodes.statusCode204:
        return true;
      case StatusCodes.statusCode400:
      case StatusCodes.statusCode401:
      case StatusCodes.statusCode403:
      case StatusCodes.statusCode404:
      case StatusCodes.statusCode417:
      case StatusCodes.statusCode500:
      case StatusCodes.statusCode504:
        return false;
    }
  }
}
