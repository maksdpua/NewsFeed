//
//  NFDetailController.m
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "NFDetailController.h"

@interface NFDetailController()

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end

@implementation NFDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [UIWebView new]; loadRequest:;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.contentURL]]];
}

@end
