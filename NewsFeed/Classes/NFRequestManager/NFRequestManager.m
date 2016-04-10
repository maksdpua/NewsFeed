//
//  NFRequestManager.m
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "NFRequestManager.h"

typedef void (^recieveBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^failBlock)(NSURLSessionDataTask *task, NSError *error);

@interface NFRequestManager()

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property recieveBlock recieve;
@property failBlock fail;

@end



@implementation NFRequestManager

- (instancetype)init {
    self = [super init];
    if (self) {
        self.manager = [AFHTTPSessionManager new];
    }
    return self;
}

- (void)requestWithURL:(NSString *)urlString responseWithBlock:(void(^)(NSURLSessionDataTask *task, id responseObject))responseBlock errorWithBlock:(void(^)(NSURLSessionDataTask *task, NSError *error))errorBlock {
    
    self.recieve = responseBlock;
    self.fail = errorBlock;
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self.manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"Succsess %@", responseObject);
        responseBlock(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(task, error);
        NSLog(@"error %@", error);
    }];
    
//    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:nil progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        
//    }];
//    [uploadTask resume];
    
//    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:nil error:&error];
//
//    [self.manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        if (responseObject) {
//            NSLog(@"Succsess %@", responseObject);
//            responseBlock(response, responseObject);
//        } else if (error) {
//            errorBlock(response, error);
//            NSLog(@"error %@", error);
//        }
//    }];
    
}

@end
