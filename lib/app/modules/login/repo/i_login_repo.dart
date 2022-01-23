import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

abstract class ILoginRepo {

  Future<bool> authentication(String email);

}