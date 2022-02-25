class DefaultResponse<T extends Object> {
  final T? value;
  final String? message;
  final bool hasError;

  DefaultResponse({this.value, this.message, this.hasError = false});

  factory DefaultResponse.error({required String message}) =>
      DefaultResponse(message: message, hasError: true);
}
