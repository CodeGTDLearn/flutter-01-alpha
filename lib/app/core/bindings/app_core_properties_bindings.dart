import 'package:flutter_01_alpha/app/core/properties/app_core_delay_properties.dart';
import 'package:flutter_01_alpha/app/core/properties/app_core_properties.dart';
import 'package:get/instance_manager.dart';

import '../properties/app_core_image_properties.dart';
import '../properties/app_core_localization_properties.dart';
import '../properties/app_core_datasource_urls.dart';

class AppCorePropertiesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppCoreProperties());
    Get.lazyPut(() => AppCoreImageProperties());
    Get.lazyPut(() => AppCoreDelayProperties());
    Get.lazyPut(() => AppCoreLocalizationProperties());
    Get.lazyPut(() => AppCoreDatasourceUrls());
  }
}