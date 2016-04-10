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
#import "NFDetailController.h"

@interface NFNewsFeedController ()<NFNewsFeedDelegate>

@property (nonatomic, strong) NFNewsFeedDatasouce *dataSource;
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;

@end

static NSString *const kDefaultURLstring = @"http://tgs.themindstudios.com/api/v1/application/ios_test_task/articles";
static NSString *const kCellIdentifier = @"NFNewsFeedCell";
static NSString *const kDetailController = @"NFDetailController";


@implementation NFNewsFeedController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[NFNewsFeedDatasouce alloc] initWithDelegate:self];
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = 100;
    [self.dataSource requestWithURL:kDefaultURLstring];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NFDetailController *detail = [self.storyboard instantiateViewControllerWithIdentifier:kDetailController];
    detail.model = [self.dataSource modelAtIndex:indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
