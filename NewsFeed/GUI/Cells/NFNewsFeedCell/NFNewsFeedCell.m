//
//  NFNewsFeedCell.m
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "NFNewsFeedCell.h"
#import "UIImageView+Loader.h"
#import "MSCache.h"

@interface NFNewsFeedCell()

@property (nonatomic, weak) IBOutlet UIImageView *thumbnail;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *title;

@end

@implementation NFNewsFeedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderWidth = 10;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
}


- (void)prepareForReuse {
    [super prepareForReuse];
    self.thumbnail.image = nil;
    self.title.text = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Custom methods

- (void)setupWithModel:(NFFeedElement *)model {
    self.title.text = model.title;
    if ([MSCache objectForKey:model.imageMedium]) {
        self.thumbnail.image = [UIImage imageWithData:[MSCache objectForKey:model.imageMedium]];
    } else {
        [self.thumbnail setImageWithURLString:model.imageMedium];
    }
}

@end
