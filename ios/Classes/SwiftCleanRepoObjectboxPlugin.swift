import Flutter
import UIKit

public class SwiftCleanRepoObjectboxPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "clean_repo_objectbox", binaryMessenger: registrar.messenger())
    let instance = SwiftCleanRepoObjectboxPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
