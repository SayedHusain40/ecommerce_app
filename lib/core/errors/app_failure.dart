class AppFailure {
  final String message;
  final int? statusCode;
  final String? code;

  const AppFailure({
    required this.message,
    this.statusCode,
    this.code,
  });
}