// ignore_for_file: prefer_final_fields, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_01_alpha/app/core/components/messager_indicator_adaptive.dart';
import 'package:flutter_01_alpha/app/core/components/modal/i_adaptive_modal.dart';
import 'package:flutter_01_alpha/app/core/exceptions/types/no_connection_exception.dart';
import 'package:flutter_01_alpha/app/core/properties.dart';
import 'package:flutter_01_alpha/app/core/text/labels.dart';
import 'package:flutter_01_alpha/app/core/text/message_labels.dart';
import 'package:get/get.dart';

import 'elevator_list_service.dart';
import 'entity/elevator.dart';

class ElevatorListController extends GetxController {
  final _properties = Get.find<Properties>();
  final _service = Get.find<ElevatorListService>();
  late final _modal;

  // final _modal = Get.find<IAdaptiveModal>(tag: Platform.operatingSystem);
  final _messages = Get.find<MessageLabels>();
  final _labels = Get.find<Labels>();

  var _notOnlineElevatorListObs = <Elevator>[].obs;

  var _buttonLabelStatusObs = "Not-Online".obs;
  var _buttonColorObs = Colors.red.obs;
  var _buttonShadowBlurObs = 15.0.obs;
  var _buttonScaleObs = false.obs;

  var _elevatorListViewCupertinoContext;

  @override
  void onInit() {
    getNotonlineElevators();
    _modal = Get.find<IAdaptiveModal>(tag: _properties.appPlatform);
  }

  Future<String> updateStatus(String id) {
    return _service.updateElevatorStatus(id).then((elevatorStatus) {
      if (elevatorStatus == 'online') {
        var index =
            _notOnlineElevatorListObs.indexWhere((item) => item.id.toString() == id);
        _notOnlineElevatorListObs.removeAt(index);
        buttonLabelStatusObs.value = elevatorStatus;
        return elevatorStatus;
      }
      return elevatorStatus;
    });
  }

  Future<List<Elevator>> getNotonlineElevators() {
    return _service
        .getNotonlineElevators()
        .then((elevatorList) => _notOnlineElevatorListObs.value = elevatorList);
  }

  void statusButtonAnimation({required MaterialColor color, required double blur}) {
    _buttonColorObs.value = color;
    _buttonShadowBlurObs.value = blur;
    _buttonScaleObs.value = !_buttonScaleObs.value;
  }

  Future<void> modalToConfirmingStatusChange(
    context,
    Elevator elevator,
  ) async {
    return _modal.create(
      context,
      _messages.confirmation,
      _labels.yes,
      _labels.no,
      () async {
        await updateStatus(elevator.id.toString()).then((status) async {
          if (status == 'offline') {
            MessageIndicatorAdaptive.message(
                message: _messages.errorUpdateTryAgain, fontSize: 20);
          }
          if (status == 'online') await _elevatorUpdateOkClosingModal(status, elevator);
          if (status == 'error') _elevatorUpdateFailingImpedingTheElevatorUpdate();
        });
      },
      () {
        statusButtonAnimation(color: Colors.red, blur: 15);
        Get.back();
        _buttonScaleObs.value = false;
      },
    );
  }

  void _elevatorUpdateFailingImpedingTheElevatorUpdate() {
    Get.back();
    Get.snackbar(_labels.ops, _messages.errorUpdateTryAgain,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  Future<void> _elevatorUpdateOkClosingModal(
    String elevatorStatus,
    Elevator elevator,
  ) async {
    Get.back(); // close modal
    elevator.status = elevatorStatus;
    statusButtonAnimation(color: Colors.green, blur: 15);
    await Future.delayed(Duration(milliseconds: _properties.delayStatusElevator))
        .whenComplete(() {
      Get.back();
      statusButtonAnimation(color: Colors.red, blur: 15);
    });
  }

  Future<void> changingElevatorStatus(context, Elevator elevator) async {
    statusButtonAnimation(color: Colors.red, blur: 0);
    await Future.delayed(const Duration(milliseconds: 1000));
    modalToConfirmingStatusChange(context, elevator);
  }

  get buttonColorObs => _buttonColorObs;

  get buttonShadowBlurObs => _buttonShadowBlurObs;

  get buttonLabelStatusObs => _buttonLabelStatusObs;

  get buttonScaleObs => _buttonScaleObs;

  get notOnlineStatusObs => _notOnlineElevatorListObs;

  get elevatorListViewCupertinoContext => _elevatorListViewCupertinoContext;

  set elevatorListViewCupertinoContext(value) {
    _elevatorListViewCupertinoContext = value;
  }

  void _exceptionsThrower(var response) {
    if (response is SocketException) throw NoConnectException();
    // if (response.status.isServerError) throw NoConnectException();
    // if (response.status.connectionError) throw NoConnectException();
    // if (response.status.isNotFound) throw HttpFailException();
    // if (response.status.code == 422) throw BadFormatException();
    // if (response.status.hasError) throw GlobalException();
  }
}