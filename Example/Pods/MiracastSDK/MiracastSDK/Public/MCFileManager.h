//
//  MCFileManager.h
//  Miracast
//
//  Created by Kun Wang on 2018/7/7.
//  Copyright © 2018年 Kun Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PHAsset;

/**
 提供本地Local Server 功能
 */
@interface MCFileManager : NSObject
+ (instancetype)sharedManager;
/**
 根据PHAseet对象获取本地URL
 @param asset PHAsset
 @return url string
 */
- (NSString *)getUrlFromAsset:(PHAsset *)asset;

/**
 根据文本返回对应图片的本地URL

 @param text 文本内容
 @return 图片地址
 */
- (NSString *)imageURLWithText:(NSString *)text;


/**
 根据音乐ID获得音乐的本地URL

 @param musicID 音乐ID
 @return 音乐地址
 */
- (NSString *)getUrlFromMusicID:(NSString *)musicID;

/**
 本地服务URL

 @return 本地服务URL
 */
- (NSString *)serverURL;


/**
 获取图片封面

 @param asset PHAsset
 @param completion 封面获取回调
 */
- (void)scaledSizeOfAsset:(PHAsset *)asset
               completion:(void (^)(CGSize size))completion;
@end
