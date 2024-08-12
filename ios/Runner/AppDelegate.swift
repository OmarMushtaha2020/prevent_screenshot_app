    import UIKit
    import Flutter

    @UIApplicationMain
    @objc class AppDelegate: FlutterAppDelegate {
        override func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
            self.window?.secureApp()  // Unwrap the window optional safely
            GeneratedPluginRegistrant.register(with: self)
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
    }

    extension UIWindow {
        func secureApp() {
            let field = UITextField()
            field.isSecureTextEntry = true
            self.addSubview(field)

            // Replace centerXYAnchor with centerXAnchor and centerYAnchor
            field.translatesAutoresizingMaskIntoConstraints = false
            field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

            // Handle the layer's optional safely
            if let superlayer = self.layer.superlayer {
                superlayer.addSublayer(field.layer)
            }

            if let firstSublayer = field.layer.sublayers?.first {
                firstSublayer.addSublayer(self.layer)
            }
        }
    }
