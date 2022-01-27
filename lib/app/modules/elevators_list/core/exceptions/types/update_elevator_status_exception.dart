class UpdateElevatorStatusException implements Exception {
  final String _title;
  final String _error;

  UpdateElevatorStatusException(this._title, this._error);

  @override
  String toString() {
    return """
        UpdateElevatorStatus
        a) Title: $_title
        b) Error: $_error
    """;
  }
}