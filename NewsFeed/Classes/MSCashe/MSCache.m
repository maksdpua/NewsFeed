//
//  MSCache.h
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "MSCache.h"
#import <CommonCrypto/CommonDigest.h>

static NSString * const cacheFolderName = @"Cache";

@implementation MSCache


+ (void)setDataForKey:(NSData *)data forKey:(NSString *)key {
    if (!data || !key) return;
    NSString *md5String = [[self MD5WithString:key] stringByAppendingPathExtension:@"jpeg"];
    NSString *fullPathName = [[self fullPath] stringByAppendingPathComponent:md5String];
    
    [data writeToFile:fullPathName atomically:YES];
}

+ (NSData *)objectForKey:(NSString *)key {
    if (!key) return nil;
    NSString *md5String = [[self MD5WithString:key] stringByAppendingPathExtension:@"jpeg"];
    NSString *fullPathName = [[self fullPath] stringByAppendingPathComponent:md5String];
    
    return [NSData dataWithContentsOfFile:fullPathName];
}

+ (NSString *)MD5WithString:(NSString *)string {
    
    const char *ptr = [string UTF8String];
    
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, (int)strlen(ptr), md5Buffer);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    return output;
}


+ (NSString *)fullPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if (paths.count < 1)
        return nil;
    
    NSString *rootFolder = [paths firstObject];
    NSString *fullFolderPath = [rootFolder stringByAppendingPathComponent:cacheFolderName];
    
    BOOL isDirectory;
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:fullFolderPath isDirectory:&isDirectory] || !isDirectory) {
        NSError *error;
        NSDictionary *attr = [NSDictionary dictionaryWithObject:NSFileProtectionComplete
                                                         forKey:NSFileProtectionKey];
        
        [manager createDirectoryAtPath:fullFolderPath
           withIntermediateDirectories:YES
                            attributes:attr
                                 error:&error];
        if (error) {
            NSLog(@"Error creating directory path: %@", [error localizedDescription]);
            return nil;
        }
    }

    return fullFolderPath;
}

+ (void)removeAllCache {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    [manager removeItemAtPath:[self fullPath] error:&error];
    if (error) {
        NSLog(@"REMOVE ALL CASHE ERROR %@", error);
    }
}

@end
