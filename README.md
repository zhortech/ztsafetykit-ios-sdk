# ZTSafetyKit

[![Platforms](https://img.shields.io/cocoapods/p/ZTSafetyKit.svg)](https://cocoapods.org/pods/ZTSafetyKit)
[![License](https://img.shields.io/cocoapods/l/ZTSafetyKit)](https://raw.githubusercontent.com/zhortech/ztsafetykit-ios-sdk/main/LICENSE)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/ZTSafetyKit.svg)](https://cocoapods.org/pods/ZTSafetyKit)

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 13.0+
- Xcode 11.0+

## Installation

### Dependency Managers
<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate ZTSafetyKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

pod 'ZTSafetyKit', :git => "https://github.com/zhortech/ztsafetykit-ios-sdk.git"
```
Please add post install script at the end of `Podfile` if there is problem to use  library:

```ruby
post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use ZTSafetyKit as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ZTSafetyKit",
    dependencies: [
        .package(url: "https://github.com/zhortech/ztsafetykit-ios-sdk.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(name: "ZTSafetyKit", dependencies: ["ZTCoreKit"])
    ]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate ZTSafetyKit into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add ZTSafetyKit as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/zhortech/ztsafetykit-ios-sdk.git
$ git submodule update --init --recursive
```

- Open the new `ZTSafetyKit` folder, and drag the `ZTSafetyKit.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `ZTSafetyKit.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `ZTSafetyKit.xcodeproj` folders each with two different versions of the `ZTSafetyKit.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `ZTSafetyKit.framework`.

- And that's it!

> The `ZTSafetyKit.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
  <summary><strong>Embedded Binaries</strong></summary><p>

- Download the latest release from https://github.com/zhortech/ztsafetykit-ios-sdk/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `ZTSafetyKit.framework`.
- And that's it!

</p></details>

## Usage

### Product setup

It is required to calibrate shoes once before starting to use them first time. Shoes shouldn't move during calibration. 

```swift
ZTSafety.shared.startStandUpPostureCalibration { (error) in
    debugPrint("Error callirating: \(String(describing: error))")
}
```

### Activity Start

To start activity first subscribe to activity change state `onActivityStateChange`:
```swift

ZTSafety.shared.onActivityStateChange.subscribe(with: self) { (activityId, actualState, error) in
    debugPrint("Activity id: \(String(describing: error)); actualState: \(String(describing: error)); error: \(String(describing: error))")
}

```
And call start activity: 
```swift

ZTSafety.shared.startActivity()
```
Activity may not start for several reasons. Corresponding error will be returned in this case. If activity is started - activity id will be returned.

### Activity stop. 
Activity can be stopped calling `stopActivity()`. 
Initially subscribe to activity stopped event
```swifft

ZTSafety.shared.onActivityStopped.subscribeOnce(with: self) { (activityId, actualState, error) in
    debugPrint("Activity stopped with activityId: \(activityId ?? ""), state: \(actualState), error: \(error?.localizedDescription ?? "")")
}
```
And finally call stop activity
```swift

ZTSafety.shared.stopActivity()
```

Activity can be also stopped automatically because of idle state and shoes went into sleep mode or battery low level. 
You can subscribe for this event to be notified:

```swift

ZTSafety.shared.onActivityStateChange.subscribe(with: self) { (activityId, actualState, error) in
    debugPrint("Activity state changed for activityId: \(activityId ?? ""), state: \(actualState), error: \(error?.localizedDescription ?? "")")
}
```
### Activity data

### Realtime posture 
To obtain relatime posture you should subscribe to `onRealtimePosturesChange.
```swift

if ZTSafety.shared.onRealtimePosturesChange.observers.count == 0 {
    ZTSafety.shared.onRealtimePosturesChange.subscribe(with: self) { (posture) in
        debugPrint(String(describing: posture))
    }
}

```

### Activity summary
You can request summary for previous activity completed by calling:
```swift

ZTSafety.shared.getActivitySummary(id: id) { (activitySummary, error) in
    debugPrint("activity summary: \(String(describing: activitySummary)), error - \(String(describing: error))")
}

```

## Author

ZhorTech [@zhortech](https://twitter.com/zhortech)

## License

ZTSafetyKit is released under the MIT license. See [LICENSE](https://github.com/zhortech/ztsafetykit-ios-sdk.git/blob/master/LICENSE) for details.
