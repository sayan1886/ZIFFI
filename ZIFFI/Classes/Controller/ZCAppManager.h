//
//  ZCAppManager.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, ZCDataFetchStatus) {
    ZCDataFetchStatusUnknown = 1001,
    ZCDataFetchStatusFetching = 1002,
    ZCDataFetchStatusCompleted = 1003
};

typedef NS_ENUM(NSInteger, ZCDataPersistenceStatus) {
    ZCDataPersistenceStatusUnknown = 2001,
    ZCDataPersistenceStatusSaveCompeleted = 2002,
    ZCDataPersistenceStatusLoadingCompleted = 2003
};


typedef void(^ZCAppManagerCompletionHandler)  (id handler);

@interface ZCAppManager : NSObject

@property (nonatomic, strong, readonly) NSNumber *page;

+ (instancetype) sharedAppManager;
- (void) searchInZiffiWithSearchParam:(NSDictionary *)searchParam withCompletionHandler:(ZCAppManagerCompletionHandler)handler;
- (BOOL) loadSearchDataFromPersistence;
- (BOOL) saveSearchDataToPersistence;
@end
