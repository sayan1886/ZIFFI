//
//  ZCNetworkManager.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 8/18/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCNetworkManager.h"
#import "AFNetworking.h"

#define REQUEST_TIMEOUT_THRESOLD 241

@interface ZCNetworkManager  ()
@property (nonatomic, strong) NSURL *requestURL;
@property (nonatomic, assign) NSInteger lastResponseStatusCode;
@property (nonatomic, strong) id lastResponseObject;
@property (nonatomic, strong) NSError *error;
@end

@implementation ZCNetworkManager

+ (instancetype) defaultNetworkManager{
    return SHARED_INSTANCE([[self alloc] init]);
}

- (id) init {
    if ( (self = [super init]) ) {
        // Initialization code here.
            }
    return self;
}

- (void) createRequestURLFromBaseURLString:(NSString *) baseURLString andQueryPath:(NSString *) path{
    NSString *requestURLString = baseURLString;
    requestURLString = [baseURLString stringByAppendingString:path];
    self.requestURL = [NSURL URLWithString:requestURLString];
}

- (void) GETfromPath:(NSString *)queryPath withParameters:(NSDictionary *)params success:(ZCNetworkManagerSuccessBlock)success failure:(ZCNetworkManagerFailureBlock) failure{
    [self createRequestURLFromBaseURLString:ZIFFY_BASE_URL andQueryPath:queryPath];
    __weak typeof(self) weakSelf = self;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setTimeoutInterval:REQUEST_TIMEOUT_THRESOLD];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:[self.requestURL absoluteString] parameters:params success:^(AFHTTPRequestOperation * operation, id response) {
        weakSelf.lastResponseObject = response;
        weakSelf.lastResponseStatusCode = operation.response.statusCode;
        success(response);
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        weakSelf.error = error;
        weakSelf.lastResponseObject = operation.response;
        weakSelf.lastResponseStatusCode = operation.response.statusCode;
        failure([NSString stringWithFormat:@"Operation failed with Status Code : @%ld", self.lastResponseStatusCode ], error);
    }];
}

- (void) POSTtoPath:(NSString *)queryPath withParameters:(NSDictionary *)params success:(ZCNetworkManagerSuccessBlock)success failure:(ZCNetworkManagerFailureBlock) failure {
    [self createRequestURLFromBaseURLString:ZIFFY_BASE_URL andQueryPath:queryPath];
    __weak typeof(self) weakSelf = self;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setTimeoutInterval:REQUEST_TIMEOUT_THRESOLD];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:[self.requestURL absoluteString] parameters:params success:^(AFHTTPRequestOperation * operation, id response) {
        weakSelf.lastResponseObject = response;
        weakSelf.lastResponseStatusCode = operation.response.statusCode;
        success(response);
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        weakSelf.error = error;
        weakSelf.lastResponseObject = operation.response;
        weakSelf.lastResponseStatusCode = operation.response.statusCode;
        failure([NSString stringWithFormat:@"Operation failed with Status Code : @%ld", self.lastResponseStatusCode ], error);
    }];
}

@end
