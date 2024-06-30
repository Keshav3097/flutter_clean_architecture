
import 'package:flutter/foundation.dart';
import '../../../../core/http_helper/api_response_status_model.dart';
import '../../../../core/http_helper/http_client.dart';
import '../../../../core/http_helper/models/request_model.dart';
import '../models/my_tasks_request_model.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/model/use_case_request_model.dart';
import '../../../../core/params/api_header.dart';
import '../models/auth_response_model.dart';
import '../models/my_tasks_response_model.dart';

abstract class MyTasksDataSource {
  Future<RequestStatus<MyTasksResponseModel>> postMyTasks({
    required UseCaseRequestModel<MyTasksRequestModel> useCaseRequestModel,
  });
  Future<RequestStatus<AuthResponseModel>> authCheck();
}

class MyTasksDataSourceImpl extends MyTasksDataSource {
  HttpClientManager httpClientManager;

  MyTasksDataSourceImpl({required this.httpClientManager});
  @override
  Future<RequestStatus<AuthResponseModel>> authCheck() async {
    try {
      var header = await ApiHeader.getHeader();
      APIResponseStatusModel response = await httpClientManager.postAPI(
        apiURL: ApiConstants.authCheckUrl,
        header: header,
      );
      if (response.status == APIResponseStatusModel.success) {
        return RequestStatus<AuthResponseModel>(
          RequestStatus.SUCCESS,
          null,
          authResponseModelFromJson(response.body!),
        );
      } else {
        debugPrint('session expired ${response.message}');
        return RequestStatus<AuthResponseModel>(
          RequestStatus.FAILURE,
          response.message,
          null,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Auth  catch${e.toString()}');
      }
      return RequestStatus<AuthResponseModel>(
        RequestStatus.FAILURE,
        "Try Again Later",
        null,
      );
    }
  }

  @override
  Future<RequestStatus<MyTasksResponseModel>> postMyTasks({
    required UseCaseRequestModel<MyTasksRequestModel> useCaseRequestModel,
  }) async {
    try {
      var header = await ApiHeader.getHeader();

      APIResponseStatusModel response = await httpClientManager.postAPI(
        apiURL: ApiConstants.dashboardUrl,
        header: header,
        body: myTasksRequestModelToJson(useCaseRequestModel.body!),
        query: useCaseRequestModel.query,
      );

      if (kDebugMode) {
        print("My Tasks Data Source ${response.status}");
      }

      if (response.status == APIResponseStatusModel.success) {
        var res = myTasksResponseModelFromJson(response.body!);
        return RequestStatus<MyTasksResponseModel>(
          RequestStatus.SUCCESS,
          null,
          res,
        );
      } else {
        return RequestStatus<MyTasksResponseModel>(
          RequestStatus.FAILURE,
          response.message,
          null,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('My Tasks Data Source  catch${e.toString()}');
      }
      return RequestStatus<MyTasksResponseModel>(
        RequestStatus.FAILURE,
        "Something Went Wrong",
        null,
      );
    }
  }
}