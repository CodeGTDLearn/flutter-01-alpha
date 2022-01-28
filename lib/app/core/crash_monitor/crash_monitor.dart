import 'package:catcher/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../platforms/cupertino_styles.dart';
import 'crashlytics_handler.dart';

class CrashMonitor {
  final _crashMonitorKey = Catcher.navigatorKey;

  final _redScreenSubstitute = (BuildContext context, Widget? widget) {
    Catcher.addDefaultErrorWidget(
        showStacktrace: true,
        title: "Ops..",
        description: "Descr.:",
        maxWidthForSmallMode: 150);
    return GetPlatform.isIOS
        ? CupertinoPageScaffold(
            // navigationBar:
            //     CupertinoNavigationBar(middle: Text('Opsss! Please, send it for us.')),
            resizeToAvoidBottomInset: true,
            backgroundColor: CupertinoStyles.scaffoldColor,
            child: widget!)
        : Scaffold(
            // appBar: AppBar(title: Text('Opsss! Please, send it for us.')),
            body: widget!,
          );
  };

  get crashRedScreenSubstitute => _redScreenSubstitute;

  get key => _crashMonitorKey;

  void runApp(Widget runApp) {
    CatcherOptions developmentOptions = CatcherOptions(
      DialogReportMode(),
      [
        CrashlyticsHandler(
            enableDeviceParameters: true,
            enableApplicationParameters: true,
            enableCustomParameters: true,
            printLogs: true),
        ConsoleHandler(),
        // EmailManualHandler(["pvba04@gmail.com"]),
      ],
    );

    CatcherOptions productionOptions = CatcherOptions(
      DialogReportMode(),
      [
        ConsoleHandler(),
        // EmailManualHandler(["email@email.com"]),
      ],
    );

    Catcher(
      rootWidget: runApp,
      debugConfig: developmentOptions,
      releaseConfig: productionOptions,
      ensureInitialized: true,
    );
  }
}