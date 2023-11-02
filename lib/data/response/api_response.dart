import 'package:mvvm_flutter_provider/data/response/status.dart';

// Type Parameter -> T
// We specify the data type when creating instances of the class, such as ApiResponse<int>
class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

// Static Factory Constructors.
  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

// Override the method
  @override
  String toString() {
    return "Status : $status \n Message: $message\n Data: $data";
  }
}
