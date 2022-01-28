import 'package:flutter/widgets.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_image_properties.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../login_controller.dart';

class LoginButton {
  final _properties = Get.find<AppCoreImageProperties>();

  Container create(
    BuildContext context,
    LoginController controller,
    double height,
    double width,
  ) {
    return Container(
        // color: Colors.green,
        width: double.infinity,
        alignment: Alignment.center,
        child: GestureDetector(
            child: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 750),
                alignment: Alignment.center,
                curve: Curves.fastOutSlowIn,
                height: height,
                width: width,
                transform: (controller.buttonScaleObs.value
                    ? (Matrix4.identity()
                      ..translate(0.025 * width, 0.025 * height)
                      ..scale(0.95, 0.95))
                    : Matrix4.identity()),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.buttonColorObs.value,
                    border: Border.all(color: controller.buttonColorObs.value),
                    boxShadow: [
                      BoxShadow(
                          color: controller.buttonColorObs.value,
                          blurRadius: controller.buttonShadowBlurObs.value),
                    ]),
                child: Image(image: AssetImage(_properties.appLoginImgBtn)),
              ),
            ),
            onTap: () => controller.loginButtonAction(context)));
  }
}