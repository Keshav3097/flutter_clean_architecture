 


import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'api_response_status_model.dart';

class ResponseHandler {
  APIResponseStatusModel<T> setHandler<T>({required http.Response response})
  {
    switch (response.statusCode) {
      case 200:
        return APIResponseStatusModel(status: APIResponseStatusModel.success,message: "",body: response.body);
      case 204:
        return _checkErrorCode(response);
      case 400:
        return _checkErrorCode(response);
      case 401:
        return APIResponseStatusModel(status: APIResponseStatusModel.unauthorized,message: jsonDecode(response.body)['message'] ?? "UnAuthorized Access",body: response.body);
      case 403:
        return _checkErrorCode(response);
      case 440 :
        return APIResponseStatusModel(status: APIResponseStatusModel.unauthorized,message: jsonDecode(response.body)['message'] ?? "UnAuthorized Access",body: response.body);
      case 432 :
        return APIResponseStatusModel(status: APIResponseStatusModel.invalid,message: jsonDecode(response.body)['message'] ?? "Something went wrong, please try again latter",body: response.body);
      case 404:
        return APIResponseStatusModel(status: APIResponseStatusModel.invalid,message: jsonDecode(response.body)['message'] ?? "Something went wrong, please try again latter",body: response.body);
      case 500:
        return _checkErrorCode(response);
      default:
        return _checkErrorCode(response);

    }


  }


  APIResponseStatusModel<T> setMultipartHandler<T>({required Response response})
  {
    switch (response.statusCode) {
      case 200:
        return APIResponseStatusModel(status: APIResponseStatusModel.success,message: "",body: response.data);
      case 204:
        return _checkMultipartErrorCode(response);
      case 400:
        return _checkMultipartErrorCode(response);
      case 401:
        return APIResponseStatusModel(status: APIResponseStatusModel.unauthorized,message: "unAuthorized User",body: response.data);
      case 403:
        return _checkMultipartErrorCode(response);
      case 440 :
        return APIResponseStatusModel(status: APIResponseStatusModel.unauthorized,message: jsonDecode(response.data)['message'] ?? "Something went wrong, please try again latter",body: response.data);
      case 432 :
        return APIResponseStatusModel(status: APIResponseStatusModel.invalid,message: jsonDecode(response.data)['message'] ?? "Something went wrong, please try again latter",body: response.data);
      case 404:
        return APIResponseStatusModel(status: APIResponseStatusModel.invalid,message: jsonDecode(response.data)['message'] ?? "Something went wrong, please try again latter",body: response.data);
      case 500:
        return _checkMultipartErrorCode(response);
      default:
        return _checkMultipartErrorCode(response);

    }


  }

  /// To be used inside else block of non 200 response codes

  /// It returns requestStatus with appropriate message

  /// according to the response error codes

  APIResponseStatusModel<T> _checkErrorCode<T>(http.Response response) {
      String msg = jsonDecode(response.body)['message'] ??
          jsonDecode(response.body)['error'] ??
          'Something went wrong, please try again later';
      return APIResponseStatusModel<T>(status:APIResponseStatusModel.failure,message: msg, body: null );
  }

  APIResponseStatusModel<T> _checkMultipartErrorCode<T>(Response response) {
    String msg = jsonDecode(response.data)['message'] ??
        jsonDecode(response.data)['error'] ??
        'Something went wrong, please try again later';
    return APIResponseStatusModel<T>(status:APIResponseStatusModel.failure,message: msg, body: null );
  }

  /// Used inside every catch block of api call

  /// It returns Failed [RequestStatus] with appropriate message

  APIResponseStatusModel<T> _commonCatchBlock<T>(e) {

    if (e is TimeoutException || e is SocketException) {
      return APIResponseStatusModel<T>(status:APIResponseStatusModel.failure,message: 'Check internet connection', body: null );
    }
    return   APIResponseStatusModel<T>(status:APIResponseStatusModel.failure,message: 'Something went wrong', body: null );
  }
}