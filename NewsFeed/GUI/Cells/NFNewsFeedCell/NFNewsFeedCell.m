//
//  NFNewsFeedCell.m
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "NFNewsFeedCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "UIImage+UIImage_Placeholder.h"

@interface NFNewsFeedCell()

@property (nonatomic, weak) IBOutlet UIImageView *thumbnail;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *title;

@end

@implementation NFNewsFeedCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setupWithModel:(NFFeedElement *)model {
    self.title.text = model.title;
    [self.thumbnail setImageWithURL:[NSURL URLWithString:model.imageMedium] placeholderImage:[UIImage placeholder]];
}


- (CGFloat)heightForRowWith:(NFFeedElement *)model {

    self.title.frame = CGRectMake(0, 0, self.title.frame.size.width, CGFLOAT_MAX);
    self.title.text = model.title;
    [self.title sizeToFit];
    return self.title.frame.size.height;
    
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.thumbnail.image = nil;
    self.title.text = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end