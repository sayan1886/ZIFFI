//
//  ZCHelper.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 19/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCHelper.h"

@implementation ZCHelper
+ (NSURL *)documentsDirectoryURL {
    NSError *error = nil;
    NSURL *url = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                        inDomain:NSUserDomainMask
                                               appropriateForURL:nil
                                                          create:NO
                                                           error:&error];
    if (error) {
        // Figure out what went wrong and handle the error.
    }
    
    return url;
}

+ (NSString *)documentsDirectoryPath {
    return [[self documentsDirectoryURL] relativePath];
}


+ (id) unarchiveDataFormFilePath:(NSString *)filePath andKey:(id)key{
    id unarchivedData = nil;
    NSData *formData = [[NSData alloc] initWithContentsOfFile:filePath];
    if (formData == nil) return nil;
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:formData];
    unarchivedData = [unarchiver decodeObjectForKey:key];
    [unarchiver finishDecoding];
    return unarchivedData;
}

+ (BOOL) archiveData:(id)data toFilePath:(NSString *)filePath andKey:(id)key{
    NSMutableData *archiveData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:archiveData];
    [archiver encodeObject:data forKey:key];
    [archiver finishEncoding];
    return [archiveData writeToFile:filePath atomically:YES];
}


@end
