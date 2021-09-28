import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomException implements Exception {
  final String? message;

  const CustomException({this.message = 'something went wrong!'});

  @override
  String toString() => 'Custom Exception {message: $message}';
}
