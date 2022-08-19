class VerificationFailedException implements Exception {
  const VerificationFailedException(this.error, [this.stackTrace]);

  final dynamic error;
  final String? stackTrace;

  @override
  String toString() => 'Verification failed: $error';
}
