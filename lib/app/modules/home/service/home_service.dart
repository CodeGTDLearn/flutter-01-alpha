import 'package:flutter_01_alpha/app/modules/home/repo/home_repo.dart';
import 'package:get/instance_manager.dart';

class HomeService {
  final repo = Get.find<HomeRepo>();

  int post_valorDoContador(int contagem) {
    var postar = ++contagem;
    repo.post_HttpRequest_BackEnd(postar);
    return postar;
  }

  int get_valorDoContador(){
    return repo.get_HttpRequest_BackEnd();
  }
}