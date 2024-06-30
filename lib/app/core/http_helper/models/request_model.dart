

class RequestStatus<T> {
  static const FAILURE = 0;
  static const SUCCESS = 1;
  static const LOADING = 2;

  final int status;
  String? message;
  late final T? body;

  RequestStatus(this.status, this.message, this.body);

  @override
  String toString() {
    String statusStr = status == SUCCESS ? "Success" : "Failure";
    return 'RequestStatus(status=$statusStr, message=$message, body=$body)';
  }

  static final SOMETHING_WENT_WRONG =
      RequestStatus(RequestStatus.FAILURE, 'Something went wrong', null);

  static final CHECK_INTERNET_CONNECTION =
      RequestStatus(RequestStatus.FAILURE, 'Check internet connection', null);
}
