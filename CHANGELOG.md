# Changelog

## [1.0.45](https://gitlab.com/zhor-tech/sdk/ios/ztsafetykit/-/tags/1.0.45) (2021-07-16)

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
