import 'dart:convert';

import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

import 'entity/elevator.dart';

class ElevatorListRepo {
  final _properties = Get.find<Properties>();

  Future<String> updateElevatorStatus(String id) {
    // api/elevators/{id}/online
    // @formatter:off
    var url = "${_properties.update_endp}$id/online";
    Map bodyx = {
      "status" : "status"
    };

    // HTTP-VERB(URI.PARSE + HEADERS + BODY) -> MANDATORY ORDER
    return http
          .put(
             Uri.parse(url),
             headers: {
               "content-type" : "application/json",
               "accept" : "application/json",
             },
             body: jsonEncode(bodyx))
          .then((response) {
             if (response.statusCode == 200) return "online";
             return "offline";});
    // @formatter:on



    // nicolas.genest@codeboxx.biz
    // return http
    //     .patch(Uri.parse("$noExtensionInUrlForUpdates${product.id}.json"),
    //     body: jsonEncode(objectMappedInJsonFormat))
    //     .then((response) => response.statusCode);
  }

  Future<List<Elevator>> getNotonlineElevators() {
    return http
        .get(Uri.parse(_properties.notonline_elevators_endp),
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