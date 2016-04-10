//
//  NFNewsFeedController.m
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "NFNewsFeedController.h"
#import "NFNewsFeedDatasouce.h"
#import "NFNewsFeedCell.h"
#import "NFFeedElement.h"

@interface NFNewsFeedController ()<NFNewsFeedDelegate>

@property (nonatomic, strong) NFNewsFeedDatasouce *dataSource;

@end

static NSString *const kDefaultURLstring = @"http://tgs.themindstudios.com/api/v1/application/ios_test_task/articles";
static NSString *const kCellIdentifier = @"NFNewsFeedCell";

@implementation NFNewsFeedController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[NFNewsFeedDatasouce alloc] initWithDelegate:self];
    [self.dataSource requestWithURL:kDefaultURLstring];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource modelsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NFNewsFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [cell setupWithModel:[self.dataSource modelAtIndex:indexPath.row]];
    return cell;
    
}

- (void)contentWasChanged {
    [self.tableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NFFeedElement *element = [self.dataSource modelAtIndex:indexPath.row];
//    NFNewsFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NFFeedElement *element = [self.dataSource modelAtIndex:indexPath.row];
//    NFNewsFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    return UITableViewAutomaticDimension;
}

@end
