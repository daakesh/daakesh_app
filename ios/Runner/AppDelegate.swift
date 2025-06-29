import UIKit
import Flutter
import Firebase
import FirebaseMessaging
import UserNotifications
import GoogleMaps // ✅ Google Maps

@main
@objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GeneratedPluginRegistrant.register(with: self)

 

    // ✅ Google Maps API Key
    GMSServices.provideAPIKey("AIzaSyB-njU3WygKOXJmoNAko7xxBu7BWDOY0c4") // ⬅️ Updated API key

    // ✅ Push Notification Delegates
    UNUserNotificationCenter.current().delegate = self
    Messaging.messaging().delegate = self

    // ✅ Ask for Notification Permission
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
      if let error = error {
        print("Notification permission error: \(error)")
      }
    }

    application.registerForRemoteNotifications()

    // ✅ Continue Flutter setup
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // ✅ APNs token registration
  override func application(_ application: UIApplication,
                            didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Messaging.messaging().apnsToken = deviceToken
  }
}
