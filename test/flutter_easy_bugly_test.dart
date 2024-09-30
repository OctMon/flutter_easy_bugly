import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_easy_bugly/flutter_easy_bugly_platform_interface.dart';
import 'package:flutter_easy_bugly/flutter_easy_bugly_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterEasyBuglyPlatform
    with MockPlatformInterfaceMixin
    implements FlutterEasyBuglyPlatform {
  // @override
  // Future<String?> getPlatformVersion() => Future.value('42');

  @override
  void init(
      {required String iOSAppId,
      required String androidAppId,
      String? channel}) {}

  @override
  void setUserIdentifier(String userId) {}

  @override
  void reportException(
      {required String exception, required String stackTrace}) {}
}

void main() {
  final FlutterEasyBuglyPlatform initialPlatform =
      FlutterEasyBuglyPlatform.instance;

  test('$MethodChannelFlutterEasyBugly is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterEasyBugly>());
  });

  // test('getPlatformVersion', () async {
  // FlutterEasyBugly flutterEasyBuglyPlugin = FlutterEasyBugly();
  // MockFlutterEasyBuglyPlatform fakePlatform = MockFlutterEasyBuglyPlatform();
  // FlutterEasyBuglyPlatform.instance = fakePlatform;
  //
  // expect(await flutterEasyBuglyPlugin.getPlatformVersion(), '42');
  // });
}
