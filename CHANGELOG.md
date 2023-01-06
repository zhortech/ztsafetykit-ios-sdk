# Changelog

## [1.1.51](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.1.51) (2023-01-06)

- `ZTCoreKit` version up

## [1.1.4](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.1.4) (2022-01-25)

- Support for ZTCoreKit changes

## [1.1.3](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.1.3) (2021-11-25)

- Support for Baliston firmware
- Update for new ZTCoreKit changes

## [1.1.2](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.1.2) (2021-09-17)

- Support for automatic activity starting from firmware 3.12.00.SF.04.14.  Automatic activity should be started with method `startActivity(autoStartActivity:, completion:)`
- Changed method `readGeneralState(completion:)` to have completion handler
- Fixed `ZTGaitProfileWalkingAnalysis`

## [v1.1.1](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.1.1) (2021-08-05)

- Changed support for realtime message for firmware 3.11.4.SF.4.12

## [1.1.0](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.1.0) (2021-07-16)

- Added callback to `startActivity` method - `startActivity(completion: ((activityId: String?, error: ZTError?) -> Void)?)` 
- Added callback to  `stopActivity` method - `stopActivity(completion: ((activityId: String?, error: ZTError?) -> Void)?)`
- Old methods `startActivity` and `stopActivity` are deprecated. 

## [1.0.44](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.0.44) (2021-06-11)

- Compiled library distribution

## [1.0.43](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.0.43) (2021-06-04)

- Updated `tryReconnect()` method call

## [1.0.42](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.0.42) (2021-05-27)

- Addition to `stop` activity flow to obtain and recheck activity segments. Segments also obtained after activity is stopped and sent in `activity/stop` endpoint request.    [\#RUN-1710](https://zhortech.atlassian.net/browse/RUN-1710)

## [1.0.41](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.0.41) (2021-04-07)

- Notification added for stop actiity event when stop fails  [\#RUN-1614](https://zhortech.atlassian.net/browse/RUN-1614)

## [1.0.35](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.0.35) (2021-03-25)

- Added support for Swift Package Manager (SPM)

## [1.0.34](https://github.com/zhortech/ztsafetykit-ios-sdk.git/-/tags/1.0.34) (2021-03-02)

- Slips posture support  
