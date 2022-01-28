class SplashScreenLoaderResources {
  SplashScreenLoaderResources._();

  static final instance = SplashScreenLoaderResources._();

  Future initialize({int seconds = 3}) async {
    // This is where you can load
    // the APP-RESOURCES needed by the app
    // while the splash screen is displayed.
    //
    // Remove the following FUTURE.DELAY
    // because this is bad practice in UX
    // This FUTURE.DELAY is a example
    // it is taking place the APP-RESOURCES loading
    await Future.delayed(Duration(seconds: seconds));
  }
}