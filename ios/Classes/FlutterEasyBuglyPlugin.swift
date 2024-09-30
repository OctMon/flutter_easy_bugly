import Flutter
import Bugly
import UIKit

public class FlutterEasyBuglyPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_easy_bugly", binaryMessenger: registrar.messenger())
        let instance = FlutterEasyBuglyPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let arguments = call.arguments as? [String: Any]
        switch call.method {
        case "init":
            if let arguments = arguments {
                if let appId = arguments["appId"] as? String {
                    let config = BuglyConfig()
                    let channel = arguments["channel"] as? String
                    if let channel = channel {
                        config.channel = channel
                    }
                    Bugly.start(withAppId: appId, config: config)
                }
            }
        case "setUserIdentifier":
            if let arguments = arguments, let userId = arguments["userId"] as? String {
                Bugly.setUserIdentifier(userId)
            }
        case "reportException":
            if let arguments = arguments {
                let exception = arguments["exception"] as? String
                let stackTrace = arguments["stackTrace"] as? String
                let callStack = stackTrace?.split(separator: "\n") ?? []
                Bugly.reportException(withCategory: 5, name: exception ?? "unknown", reason: "Flutter Exception", callStack: callStack, extraInfo: ["exception": exception ?? "", "stackTrace": stackTrace ?? ""], terminateApp: false)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
