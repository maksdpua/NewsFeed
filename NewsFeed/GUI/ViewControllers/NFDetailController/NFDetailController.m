//
//  NFDetailController.m
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "NFDetailController.h"

@interface NFDetailController()<UIWebViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end

@implementation NFDetailController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.scrollView.delegate = self;
    [self.webView.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.contentURL]]];
}

#pragma mark - UIWebViewDelegate methods

- (void)webViewDidFinishLoad:(UIWebView *)aWebView {
    CGRect frame = aWebView.frame;
    frame.size.height = 1;
    aWebView.frame = frame;
    CGSize fittingSize = [aWebView sizeThatFits:CGSizeZero];
    frame.size = fittingSize;
    aWebView.frame = frame;
}

#pragma mark - UIScrollViewDelegate methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x > 0)
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
}
@end
