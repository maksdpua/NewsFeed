//
//  NFNewsFeedCell.h
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFFeedElement.h"

@interface NFNewsFeedCell : UITableViewCell

@property (nonatomic, readonly, weak) IBOutlet UILabel *title;

- (void)setupWithModel:(NFFeedElement *)model;

- (CGFloat)heightForRowWith:(NFFeedElement *)model;

@end
