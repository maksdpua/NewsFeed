//
//  MSCache
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCache : NSObject

+ (void)setDataForKey:(NSData *)data forKey:(NSString *)key;

+ (NSData *)objectForKey:(NSString *)key;

+ (void)removeAllCache;

@end
