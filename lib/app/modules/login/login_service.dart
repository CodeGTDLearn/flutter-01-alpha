import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

import 'repo/i_login_repo.dart';

class LoginService {
  final repo = Get.find<ILoginRepo>();

  Future<bool> authentication(String email) {
    // @formatter:off
    return repo
            .authentication(email)
            .then((response) => response).catchError((onError) {
              Get.defaultDialog(content: Text(onError.toString()));
              return false;
            });
    // @formatter:on
  }
}