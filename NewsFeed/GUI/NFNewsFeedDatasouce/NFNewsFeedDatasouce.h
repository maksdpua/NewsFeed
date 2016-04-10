//
//  NFNewsFeedDatasouce.h
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFFeedElement.h"

@protocol NFNewsFeedDelegate;

@interface NFNewsFeedDatasouce : NSObject

@property (nonatomic, weak) id <NFNewsFeedDelegate>delegate;

- (instancetype)initWithDelegate:(id<NFNewsFeedDelegate>)delegate;
- (NFFeedElement *)modelAtIndex:(NSUInteger)index;
- (NSInteger)modelsCount;

- (void)requestWithURL:(NSString *)urlString;

@end

@protocol NFNewsFeedDelegate <NSObject>

@optional

- (void)contentWasChanged;

@end
