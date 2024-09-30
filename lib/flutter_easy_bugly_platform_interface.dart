import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_easy_bugly_method_channel.dart';

abstract class FlutterEasyBuglyPlatform extends PlatformInterface {
  /// Constructs a FlutterEasyBuglyPlatform.
  FlutterEasyBuglyPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterEasyBuglyPlatform _instance = MethodChannelFlutterEasyBugly();

  /// The default instance of [FlutterEasyBuglyPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterEasyBugly].
  static FlutterEasyBuglyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterEasyBuglyPlatform] when
  /// they register themselves.
  static set instance(FlutterEasyBuglyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void init({required String iOSAppId, required String androidAppId, String? channel}) {
    throw UnimplementedError('init() has not been implemented.');
  }

  void setUserIdentifier(String userId) {
    throw UnimplementedError('setUserIdentifier() has not been implemented.');
  }

  void reportException({required String exception, required String stackTrace}) {
    throw UnimplementedError('reportException() has not been implemented.');
  }
}
