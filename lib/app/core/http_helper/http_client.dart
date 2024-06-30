import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'response_handler.dart';

class HttpClientManager {
  http.Client? client;

  Dio? dio;

  HttpClientManager() {
    client = http.Client();
    dio = Dio();
  }

  getAPI(
      {required String apiURL,
      required Map<String, String> header,
      Map<String, dynamic>? query}) async {
    try {
      var response = await http.get(
        Uri.parse(apiURL).replace(queryParameters: query ?? {}),
        headers: header,
      );

      return ResponseHandler().setHandler(response: response);
    } catch (e) {
      print('🤯 GET Catch Error: $e');
    }
  }

  // postAPI(
  //     {required String apiURL,
  //       required Map<String, String> header,
  //       dynamic body}) async {
  //
  //   try{
  //
  //     var response = await http.post(
  //       Uri.parse(apiURL).replace(queryParameters:{}),
  //       headers: header,
  //       body: body
  //     );
  //     print("$apiURL : ${response.statusCode}");
  //     return ResponseHandler().setHandler(response: response);
  //   } catch (e) {
  //     print('🤯 POST Catch Error: $e');
  //   }
  // }

  multipartRequest({
    required String url,
    required Map<String, dynamic> requestBody,
    required List<Uint8List>? multipleFiles,
    required String token,
    required List<String> fileName,
  }) async {
    // var finalRequest = {
    //   requestBody,
    //   "attachment" : await MultipartFile.fromFile('./text.txt', filename: 'upload.txt')
    // };

    try {
      Map<String, dynamic> finalRequest = {};
      finalRequest.addAll(requestBody);
      print("FILE NAME : $fileName");

      if (multipleFiles != null || multipleFiles!.isNotEmpty) {
        List<dynamic> fileList = [];
        for (var file in multipleFiles) {
          int index = multipleFiles.indexOf(file);
          final file0 =
              MultipartFile.fromBytes(file, filename: fileName[index]);
          print("file0 $file0");
          fileList.add(file0);
        }
        finalRequest.putIfAbsent('attachments', () => fileList);
      }

      var formData = FormData.fromMap(finalRequest);

      var response = await dio!.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': '$token',
            'Accept': '*/*',
            'Content-Type': 'multipart/form-data',
          },
          contentType: 'multipart/form-data',
        ),
      );

      print("Multipart Response $response");
      return response;
      //return ResponseHandler().setMultipartHandler(response: response);
    } catch (e) {
      print("EXCEPTION1 : ${e.toString()}");
    }

    // TODO : SEND RESPONSE TO CALLBACK
  }

  multiPartFile({
    required String apiURL,
    required String filePath,
    required Map<String, String> query,
    required Map<String, String> header,
  }) async {
    var request = http.MultipartRequest("POST", Uri.parse(apiURL));
    for (var item in query.entries) {
      request.fields[item.key] = item.value;
    }
    request.files.add(await http.MultipartFile.fromPath('file', filePath));

    var response = await request.send();
    var responseData = await http.Response.fromStream(response);

    return ResponseHandler().setHandler(response: responseData);
  }

  postAPI({
    required String apiURL,
    required Map<String, String> header,
    dynamic body,
    Map<String, String>? query,
  }) async {
    try {
      var response = await http.post(
          query == null
              ? Uri.parse(apiURL)
              : Uri.parse(apiURL).replace(queryParameters: query),
          headers: header,
          body: body);
      print("$apiURL : ${response.statusCode}");
      return ResponseHandler().setHandler(response: response);
    } catch (e) {
      print('🤯 POST Catch Error: $e');
    }
  }

  putAPI({
    required String apiURL,
    required Map<String, String> header,
    dynamic body,
    Map<String, String>? query,
  }) async {
    try {
      final response =
          await http.put(Uri.parse(apiURL), headers: header, body: body);

      return ResponseHandler().setHandler(response: response);
    } catch (e) {
      print('🤯 PUT Catch Error: $e');
    }
  }
}

   

