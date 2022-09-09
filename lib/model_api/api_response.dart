class ApiResponse<T> {
  final String message;
  final bool success;
  T? data;

  ApiResponse(this.message, this.success, [this.data]);
}


class Apiresponse<T> {
  final String message;
  final bool status;
  T? model;

  Apiresponse({
    required this.message,
    required this.status,
    this.model,
  });
}
