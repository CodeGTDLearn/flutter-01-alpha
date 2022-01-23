import 'package:flutter_01_alpha/app/modules/login/repo/login_repo_http.dart';
import 'package:get/instance_manager.dart';

import 'repo/i_login_repo.dart';

class LoginService {
  final repo = Get.find<ILoginRepo>();

  Future<bool> authentication(String email) {
    return repo.authentication(email).then((response) => response);
  }
}