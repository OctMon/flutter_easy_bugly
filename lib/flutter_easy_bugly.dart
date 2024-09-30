import 'flutter_easy_bugly_platform_interface.dart';

class FlutterEasyBugly {
  static void init(
      {required String iOSAppId,
      required String androidAppId,
      String? channel}) {
    FlutterEasyBuglyPlatform.instance
        .init(iOSAppId: iOSAppId, androidAppId: androidAppId, channel: channel);
  }

  static void setUserIdentifier(String userId) {
    FlutterEasyBuglyPlatform.instance.setUserIdentifier(userId);
  }

  static void reportException(
      {required String exception, required String stackTrace}) {
    FlutterEasyBuglyPlatform.instance
        .reportException(exception: exception, stackTrace: stackTrace);
  }
}
