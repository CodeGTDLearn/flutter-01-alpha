
class MessageLabels {
  final _EMAIL_FORMAT_FIELD_LOGIN = "Please, type the email properly";
  final _AUTH_FAIL_TITLE = "OOps..";
  final _AUTH_FAIL_CONTENT = "User not found or Inexistent.";

  String email_format_field() => _EMAIL_FORMAT_FIELD_LOGIN;

  get auth_fail_content => _AUTH_FAIL_CONTENT;

  get auth_fail_title => _AUTH_FAIL_TITLE;
}