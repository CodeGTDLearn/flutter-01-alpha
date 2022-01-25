class GlobalException implements Exception {
  @override
  String toString() {
    return "Something is wronged. Try again later!";
  }
}