import 'dart:convert';

import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

import '../entity/elevator.dart';
import 'i_elevator_list_repo.dart';

class ElevatorListRepoHttp implements IElevatorListRepo {
  final _properties = Get.find<Properties>();

  @override
  Future<String> updateElevatorStatus(String id) {
    // api/elevators/{id}/online
    // @formatter:off
    var url = "${_properties.apiRootUrl}${_properties.updateEndp}$id/online";
    Map body = {
      "status" : "status"
    };

    // ATTENTION:
    // HTTP-VERB-PARAMETERS 'MANDATORY' ORDER:
    // 1) URI.PARSE
    // 2) HEADERS
    // 3) BODY
    return http
          .put(
                 Uri.parse(url),
                 headers: {
                   "content-type" : "application/json",
                   "accept" : "application/json",
                 },
                 body: jsonEncode(body)
             )
          .then((response) {
                 if (response.statusCode == 200) return "online";
                 if (response.statusCode >= 400) return "error";
                 return "offline";
          });
    // @formatter:on
  }

  @override
  Future<List<Elevator>> getNotonlineElevators() {
    var url = "${_properties.apiRootUrl}${_properties.notOnlineElevatorsEndp}";
    return http
        .get(Uri.parse(url),
            headers: {"Accept": "application/json"})
        .then(_decodeResponse)
        .catchError((onError) => throw onError);
  }

  List<Elevator> _decodeResponse(http.Response response) {
    var _elevators = <Elevator>[];

    var plainText = response.body;
    final json = jsonDecode(plainText);
    json == null
        ? _elevators = []
        :
        // Rahman
        _elevators = json.map<Elevator>((resp) => Elevator.fromJson(resp)).toList();
    return _elevators;
  }
}