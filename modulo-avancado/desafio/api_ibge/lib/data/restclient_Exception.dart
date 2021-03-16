class RestClientException implements Exception {
  final int statusCode;
  final String message;

  RestClientException(this.message, {this.statusCode});

  @override
  String toString() =>
      'RestClient Exception (Code: $statusCode, message: $message)';
}
