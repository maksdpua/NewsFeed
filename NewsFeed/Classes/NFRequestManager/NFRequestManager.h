//
//  NFRequestManager.h
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

@interface NFRequestManager : NSObject

- (void)requestWithURL:(NSString *)urlString responseWithBlock:(void(^)(NSURLSessionDataTask *task, id responseObject))responseBlock errorWithBlock:(void(^)(NSURLSessionDataTask *task, NSError *error))errorBlock;

@end
