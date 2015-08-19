//
//  ZCAppManager.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZCAppManagerCompletionHandler)  (id handler);

@interface ZCAppManager : NSObject
+ (instancetype) sharedAppManager;
- (void) searchInZiffiWithSearchPhrase:(NSString *)searchPhrase withCompletionHandler:(ZCAppManagerCompletionHandler)handler;
@end
