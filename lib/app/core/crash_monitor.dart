import 'package:catcher/catcher.dart';
import 'package:flutter/widgets.dart';

class CrashMonitor {
  static void crashMonitorRunApp(Widget runApp) {
    CatcherOptions developmentOptions = CatcherOptions(
      PageReportMode(showStackTrace: true),
      [
        ConsoleHandler(),
        EmailManualHandler(
          ["pvba04@gmail.com"],
        ),
      ],
    );

    // CatcherOptions procutionOptions = CatcherOptions(
    //   DialogReportMode(),
    //   [
    //     EmailManualHandler(["email@email.com"]),
    //     ConsoleHandler(),
    //   ],
    // );

    Catcher(
      rootWidget: runApp,
      debugConfig: developmentOptions,
      // releaseConfig: procutionOptions,
    );
  }
}