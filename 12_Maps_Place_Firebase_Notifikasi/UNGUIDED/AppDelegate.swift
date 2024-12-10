import Flutter
import UIKit
import GoogleMaps // Tambahkan impor GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Tambahkan API Key Google Maps
    GMSServices.provideAPIKey("AIzaSyDMbGRLktQQCdaEPufDgOSdnjA_ExiWHVk")
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
