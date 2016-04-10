//
//  NFNewsFeedDatasouce.m
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "NFNewsFeedDatasouce.h"
#import <MagicalRecord/MagicalRecord.h>
#import "NFRequestManager.h"
#import "NFMapper.h"

@interface NFNewsFeedDatasouce()<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchResultController;
@property (nonatomic, strong) NFRequestManager *requestManager;

@end

@implementation NFNewsFeedDatasouce

#pragma mark - DataSource methods

- (instancetype)initWithDelegate:(id<NFNewsFeedDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.requestManager = [NFRequestManager new];
        [self setupFetchResultController];
    }
    return self;
}

- (NFFeedElement *)modelAtIndex:(NSUInteger)index {
    return self.fetchResultController.fetchedObjects[index];
}

- (void)setupFetchResultController {
    self.fetchResultController = [NFFeedElement MR_fetchAllSortedBy:kDate ascending:NO withPredicate:nil groupBy:nil delegate:self];
}

- (NSInteger)modelsCount {
    return self.fetchResultController.fetchedObjects.count;
}

- (void)saveElements {
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)deleteElements {
    [NFFeedElement MR_truncateAll];
}

#pragma mark - NFRequestManager methods

- (void)requestWithURL:(NSString *)urlString {
    [self.requestManager requestWithURL:urlString responseWithBlock:^(NSURLSessionDataTask *task, id responseObject) {
        [self deleteElements];
        [NFMapper mapWithObject:responseObject];
    } errorWithBlock:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

#pragma mark - NSFetchedResultsControllerDelegate methods

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self setupFetchResultController];
    if ([self respondsToSelector:@selector(contentWasChanged)]) {
        [self.delegate contentWasChanged];
    }
}

@end
