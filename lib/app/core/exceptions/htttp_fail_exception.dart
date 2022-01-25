class HttpFailException implements Exception {

  @override
  String toString() {
    return "Application resource not found!";
  }
}