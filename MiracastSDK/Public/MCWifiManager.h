//
//  MCWifiManager.h
//  AFNetworking
//
//  Created by Kun Wang on 2018/7/1.
//

#import <Foundation/Foundation.h>

@class MCDeviceInfo;
@interface MCWifiManager : NSObject
+ (instancetype)sharedManager;

/**
 开始搜索设备
 */
- (void)startMoniting;



//下面接口一般不使用，主要用于配置设备
@property (nonatomic, copy, readonly) NSString *ssid;
@property (nonatomic, strong, readonly) MCDeviceInfo *responseDeviceInfo;
- (void)clear;
- (BOOL)connectedToTubicast;
- (void)connectDeviceWithKey:(NSString *)key
                        ssid:(NSString *)ssid
                        mode:(NSString *)mode
                     devname:(NSString *)devname;
- (void)sendBroadCast;
@end
