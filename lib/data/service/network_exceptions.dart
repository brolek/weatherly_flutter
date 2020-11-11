import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherly_flutter/generated/l10n.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.CANCEL:
              networkExceptions = NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.CONNECT_TIMEOUT:
              networkExceptions = NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.DEFAULT:
              networkExceptions = NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.RECEIVE_TIMEOUT:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.RESPONSE:
              switch (error.response.statusCode) {
                case 400:
                  networkExceptions = NetworkExceptions.unauthorisedRequest();
                  break;
                case 401:
                  networkExceptions = NetworkExceptions.unauthorisedRequest();
                  break;
                case 403:
                  networkExceptions = NetworkExceptions.unauthorisedRequest();
                  break;
                case 404:
                  networkExceptions = NetworkExceptions.notFound("Not found");
                  break;
                case 409:
                  networkExceptions = NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions = NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions = NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response.statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case DioErrorType.SEND_TIMEOUT:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        return NetworkExceptions.formatException();
      } catch (_) {
        return NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptions.unableToProcess();
      } else {
        return NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions, BuildContext context) {
    String errorValue = S.of(context).error;
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = errorValue;
    }, requestCancelled: () {
      errorMessage = errorValue;
    }, internalServerError: () {
      errorMessage = errorValue;
    }, notFound: (String reason) {
      errorMessage = errorValue;
    }, serviceUnavailable: () {
      errorMessage = errorValue;
    }, methodNotAllowed: () {
      errorMessage = errorValue;
    }, badRequest: () {
      errorMessage = errorValue;
    }, unauthorisedRequest: () {
      errorMessage = errorValue;
    }, unexpectedError: () {
      errorMessage = errorValue;
    }, requestTimeout: () {
      errorMessage = errorValue;
    }, noInternetConnection: () {
      errorMessage = S.of(context).no_internet_connection;
    }, conflict: () {
      errorMessage = errorValue;
    }, sendTimeout: () {
      errorMessage = errorValue;
    }, unableToProcess: () {
      errorMessage = errorValue;
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = errorValue;
    }, notAcceptable: () {
      errorMessage = errorValue;
    });
    return errorMessage;
  }
}

extension ExtendNetworkException on NetworkExceptions {
  String getMessage(BuildContext context) {
    return NetworkExceptions.getErrorMessage(this, context);
  }
}
