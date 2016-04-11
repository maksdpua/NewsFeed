//
//  NFDetailController.m
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "NFDetailController.h"
#import "MSCache.h"

@interface NFDetailController()

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end

@implementation NFDetailController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.model.contentURL] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:15.0];
    [self.webView loadRequest:theRequest];
    
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithTitle:@"Share" style:UIBarButtonItemStyleDone target:self action:@selector(shareAction)];
    
    self.navigationItem.rightBarButtonItem = shareButton;
}

- (void)shareAction {
    NSString *textToShare = self.model.title;
    NSURL *myWebsite = [NSURL URLWithString:self.model.contentURL];
    UIImage *image = [UIImage imageWithData:[MSCache objectForKey:self.model.imageMedium]];
    NSArray *objectsToShare = @[textToShare, image, myWebsite];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
