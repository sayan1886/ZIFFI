//
//  ZCHelper.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 19/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCHelper : NSObject
+ (NSURL *)documentsDirectoryURL;
+ (NSString *)documentsDirectoryPath;
+ (id) unarchiveDataFormFilePath:(NSString *)filePath andKey:(id)key;
+ (BOOL) archiveData:(id)data toFilePath:(NSString *)filePath andKey:(id)key;
@end
