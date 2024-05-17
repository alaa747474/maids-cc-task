import 'package:dio/dio.dart';

import 'failure.dart';

class ServerError extends Failure {
  ServerError(super.errorMessage);

  factory ServerError.fromDioException(DioException exception) {
    if (exception.type == DioExceptionType.connectionTimeout) {
      return ServerError('The request connection took too long');
    }
    switch (exception.response?.statusCode) {
      case 401:
        return ServerError('Authorization required. Access denied');
      case 404:
        return ServerError(
            'Sorry, the content you are looking for could not be found');
      case 500:
        return ServerError('Internal server error. Please try again later');
      case 429:
        return ServerError(
            'Rate limit exceeded. Please wait before making more requests');
      case 400:
        return ServerError('Bad request. Please check your request parameters');
    }

    return ServerError('Something went wrong !');
  }
}



