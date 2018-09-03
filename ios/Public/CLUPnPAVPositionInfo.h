//
//  CLUPnPAVPositionInfo.h
//  DLNA_UPnP
//
//  Created by ClaudeLi on 16/10/10.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLUPnPAVPositionInfo : NSObject

@property (nonatomic, copy) NSString *track;
@property (nonatomic, copy) NSString *trackDuration;
@property (nonatomic, copy) NSString *trackMetaData;
@property (nonatomic, copy) NSString *trackURI;
@property (nonatomic, copy) NSString *relTime;
@property (nonatomic, copy) NSString *absTime;
@property (nonatomic, copy) NSString *relCount;
@property (nonatomic, copy) NSString *absCount;

- (void)setArray:(NSArray *)array;

@end


@interface CLUPnPTransportInfo : NSObject

@property (nonatomic, copy) NSString *currentTransportState;
@property (nonatomic, copy) NSString *currentTransportStatus;
@property (nonatomic, copy) NSString *currentSpeed;

- (void)setArray:(NSArray *)array;

@end

@interface CLUPnPMediaInfo : NSObject

@property (nonatomic, copy) NSString *nrTracks;
@property (nonatomic, copy) NSString *mediaDuration;
@property (nonatomic, copy) NSString *currentURI;
@property (nonatomic, copy) NSString *currentURIMetaData;
@property (nonatomic, copy) NSString *nextURI;
@property (nonatomic, copy) NSString *nextURIMetaData;
@property (nonatomic, copy) NSString *playMedium;
@property (nonatomic, copy) NSString *recordMedium;
@property (nonatomic, copy) NSString *writeStatus;

- (void)setArray:(NSArray *)array;

@end


@interface NSString(UPnP)

+(NSString *)stringWithDurationTime:(float)timeValue;
- (float)durationTime;

@end
