//
//  ZCNetworkManager.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 8/18/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZCNetworkManagerSuccessBlock)  (id response);
typedef void(^ZCNetworkManagerFailureBlock)  (id failureMessage, NSError *error);
typedef void(^ZCNetworkManagerProgressBlock) (id progressMessage, CGFloat progress);


@interface ZCNetworkManager : NSObject

@property (nonatomic, strong, readonly) NSURL *requestURL;

@property (nonatomic, assign, readonly) NSInteger lastResponseStatusCode;

@property (nonatomic, strong, readonly) id lastResponseObject;

@property (nonatomic, strong, readonly) NSError *lastError;

+ (instancetype) defaultNetworkManager;

- (void) resetCache;
- (void) GETfromPath:(NSString *)queryPath withParameters:(NSDictionary *)params success:(ZCNetworkManagerSuccessBlock)success failure:(ZCNetworkManagerFailureBlock) failure;

- (void) POSTtoPath:(NSString *)queryPath withParameters:(NSDictionary *)params success:(ZCNetworkManagerSuccessBlock)success failure:(ZCNetworkManagerFailureBlock) failure;
@end
