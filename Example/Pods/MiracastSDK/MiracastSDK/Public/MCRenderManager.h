//
//  MCRenderManager.h
//  AFNetworking
//
//  Created by Kun Wang on 2018/7/7.
//

#import <Foundation/Foundation.h>

@class CLUPnPMediaInfo;
@class CLUPnPTransportInfo;
@class CLUPnPAVPositionInfo;
@class CLUPnPDevice;
@interface MCRenderManager : NSObject
+ (instancetype)sharedManager;

/**
 停止播放
 会清空播放信息，退出播放页，播放Banner会隐藏
 */
- (void)stop;

/**
 暂停播放
 */
- (void)pause;

/**
 恢复播放
 */
- (void)resume;

/**
 调高音量

 @param completion 音量回调，回调中包含当前音量
 */
- (void)volumeUpWithCompletion:(void (^)(NSUInteger, NSError *))completion;

/**
 调低音量

 @param completion 音量回调，回调中包含当前音量
 */
- (void)volumeDownWithCompletion:(void (^)(NSUInteger, NSError *))completion;

/**
 跳到特定进度

 @param seconds 单位s
 */
- (void)seekTo:(double)seconds;

/**
 更新当前播放进度
 */
- (void)updatePosition;

/**
 重连设备
 若设备正在播放，会显示播放内容

 @param device 设备
 */
- (void)reconnectToDevice:(CLUPnPDevice *)device;

/**
 开始播放媒体

 @param device 设备
 */
- (void)renderWithDevice:(CLUPnPDevice *)device;

/**
 设置播放地址
 */
@property (nonatomic, strong) NSString *renderURLString;

/**
 设置播放内容的标题
 若不设置，会使用设备返回的标题
 */
@property (nonatomic, strong) NSString *renderTitle;

/**
 图片参数
 示例：
  {imagelist:{"images":["http://192.168.1.102#width:720#height:1080","http://192.168.1.102#width:720#height:1080"]}}
 
 */
@property (nonatomic, strong) NSString *imageParameters;
@property (nonatomic, strong, readonly) NSString *playingTitle;
@property (nonatomic, strong, readonly) CLUPnPMediaInfo *mediaInfo;
@property (nonatomic, strong, readonly) CLUPnPTransportInfo *transportInfo;
@property (nonatomic, strong, readonly) CLUPnPAVPositionInfo *positionInfo;
@property (nonatomic, assign, readonly) BOOL isPlaying;
@end
