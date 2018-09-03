# MiracastSDK

[![Version](https://img.shields.io/cocoapods/v/MiracastSDK.svg?style=flat)](https://cocoapods.org/pods/MiracastSDK)
[![License](https://img.shields.io/cocoapods/l/MiracastSDK.svg?style=flat)](https://cocoapods.org/pods/MiracastSDK)
[![Platform](https://img.shields.io/cocoapods/p/MiracastSDK.svg?style=flat)](https://cocoapods.org/pods/MiracastSDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like MiracastSDK in your projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

#### Podfile

To integrate Miracast into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'

target 'TargetName' do
pod 'MiracastSDK'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### 1.Start searching devices
```objc
[[MCWifiManager sharedManager] startMoniting];
```

### 2.Use the suspend button(recommanded)

```objc
MCSuspendButton *suspendButton = [MCSuspendButton sharedButton];
suspendButton.center = CGPointMake(UIScreen.mainScreen.bounds.size.width - suspendButton.frame.size.width / 2.0, UIScreen.mainScreen.bounds.size.height - 120 - suspendButton.frame.size.height / 2.0);
[self.window addSubview:suspendButton];
```

### 3.Use the playBanner(reommanded)

```objc
MCPlayerBanner *banner = [MCPlayerBanner sharedBanner];
[self.window addSubview:banner];
```

### 4.Manage the Device Mannually

#### 1. Get the searched devices

```objc
NSArray *devices = [[MCDeviceManager sharedManager] devices];
```

#### 2. Observe the searched devices

You can use KVO to observe the change of devices

```objc
- (void)observeDevices {
	[[MCDeviceManager sharedManager] addObserver:self
       								   forKeyPath:@"devices"
          							   options:NSKeyValueObservingOptionNew
         								   context:nil];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"devices"]) {
        NSLog(@"%@", change);
    }
}

```

#### 3. Manage a devices mannually

Read the `MCRenderManager.h` to control a certain device, including play、pause、resume、stop、adjust the volume、seek、get the state of the media .etc.



## Author

Kun Wang, wangkun@bytedance.com

## License

MiracastSDK is available under the MIT license. See the LICENSE file for more info.




## Package

- change the tag of `MiracastSDK.podspec`

```
s.source = { :git => '/Users/yourname/Miracast', :tag => '0.1.4' }
```

- commit and add a tag

```
git add .
git commit -a -m 'MiracastSDK v0.1.3'
git tag -a 0.1.3 -m 'MiracastSDK v0.1.3'
```

- install `Cocoapods-Package` if needed

```
sudo gem install cocoapods-packager
```

- package

```
pod package MiracastSDK.podspec --library --force
```

- replace the `libMiracastSDK.a` in `MiracastSDK_framework\ios`