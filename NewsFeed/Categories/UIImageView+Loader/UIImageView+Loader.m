//
//  UIImageView+Loader.m
//  NewsFeed
//
//  Created by Maks on 4/11/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "UIImageView+Loader.h"
#import "MSCache.h"

@implementation UIImageView (Loader)

- (void)setImageWithURLString:(NSString *)urlString {
    if (!urlString) return;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSOperationQueue new] addOperationWithBlock:^{
        
        NSData *data = [MSCache objectForKey:urlString];
        if (!data) {
            data = [NSData dataWithContentsOfURL:url];
            [MSCache setDataForKey:data forKey:urlString];
        }
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.image = image;
            }];
        }
    }];
    
    
}

@end
