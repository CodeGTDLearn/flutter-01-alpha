class MessageLabels {
  final _EMAIL_FORMAT_FIELD_LOGIN = "Please, type the email properly";
  final _EMAIL_LOGIN_SUCESS = "Login successfully";
  final _AUTHENTICATION_FAIL_CONTENT = "User not found or Inexistent.";
  final _ELEVATORS_NOT_FOUND_YET = "Elevators not found or Inexistent.";
  final _DB_ELEVATORS_EMPTY = "DB Elevators is empty.";
  final _ELEVATORS_ACTIVATION_CONFIRMATION = "Are you sure?";
  final _ELEVATORS_ERROR_UPDATE_TRY_AGAIN = "Update fail. Try Again";
  final _GENERAL_ERROR_MESSAGE_TRY_AGAIN = "Something is wronged. Try again later";

  get error_try_later => _GENERAL_ERROR_MESSAGE_TRY_AGAIN;

  get dbElevatorsEmpty => _DB_ELEVATORS_EMPTY;

  get emailLoginSucess => _EMAIL_LOGIN_SUCESS;

  get emailFormatField => _EMAIL_FORMAT_FIELD_LOGIN;

  get authFailContent => _AUTHENTICATION_FAIL_CONTENT;

  get elevetorNotFoundYet => _ELEVATORS_NOT_FOUND_YET;

  get confirmation => _ELEVATORS_ACTIVATION_CONFIRMATION;

  get errorUpdateTryAgain => _ELEVATORS_ERROR_UPDATE_TRY_AGAIN;
}