//
//  ZCAppManager.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCAppManager.h"
#import "AFNetworking.h"

@implementation ZCAppManager

+ (instancetype) sharedAppManager{
    return SHARED_INSTANCE([[self alloc] init]);
}

- (id) init {
    if ( (self = [super init]) ) {
        // Initialization code here.
        
    }
    return self;
}
@end
