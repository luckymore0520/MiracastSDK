//
//  MCDeviceManager.h
//  MiracastSDK
//
//  Created by Kun Wang on 2018/6/30.
//

#import <Foundation/Foundation.h>

@class CLUPnPDevice;
@interface MCDeviceManager : NSObject
+ (instancetype)sharedManager;
//搜索到的设备，若想监听变化，可以使用KVO
@property (nonatomic, copy, readonly) NSArray<CLUPnPDevice *> *devices;
@end
