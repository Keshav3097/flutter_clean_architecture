


class APIResponseStatusModel<T> {
    static const failure = 0;
    static const success = 1;
    static const loading = 2;
    static const unauthorized = 3;
    static const invalid = 4;

    final int status;
    String? message;
    late final String? body;

    APIResponseStatusModel({required this.status,required this.message,required this.body});

    @override
    String toString() {
      String statusStr = status == success ? "Success" : "Failure";
      return 'RequestStatus(status=$statusStr, message=$message, body=$body)';
    }
}


