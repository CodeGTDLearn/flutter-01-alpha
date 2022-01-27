class GetNotonlineElevatorsException implements Exception {
  final String _title;
  final String _error;

  GetNotonlineElevatorsException(this._title, this._error);

  @override
  String toString() {
    return """
        Ops...
        a) Title: $_title
        b) Error: $_error
    """;
  }
}