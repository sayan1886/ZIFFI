//
//  ZCJSONModel.m
//  ZIFFI
//
//  Created by cts_mobility5 on 8/18/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCJSONModel.h"

@implementation ZCJSONModel

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([[value class] isSubclassOfClass:[NSNull class]]) {
        value = @"";
    }
    [super setValue:value forKey:key];
}

- (id)valueForKey:(NSString *)key{
    return [super valueForKey:key];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self != nil) {
    [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
//    self.featureId = [coder decodeIntForKey:@"self.featureId"];
    
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
//    [coder encodeInt:self.featureId forKey:@"self.featureId"];
}
@end
