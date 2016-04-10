//
//  NFMapper.m
//  NewsFeed
//
//  Created by Maks on 4/10/16.
//  Copyright © 2016 Maks. All rights reserved.
//

#import "NFMapper.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation NFMapper

+ (void)mapWithObject:(id)objects {
    
    NSArray *objectsArray = objects;
    
    for (NSDictionary *objectInfo in objectsArray) {
        NFFeedElement *newElement = [NFFeedElement MR_createEntity];
        
        [newElement setValue:[NSString stringWithFormat:@"%@",[objectInfo valueForKey:@"id"]] forKey:kElementID];
        [newElement setValue:[objectInfo valueForKey:@"title"] forKey:kTitle];
        [newElement setValue:[objectInfo valueForKey:@"image_thumb"] forKey:kImageThumb];
        [newElement setValue:[objectInfo valueForKey:@"image_medium"] forKey:kImageMedium];
        [newElement setValue:[objectInfo valueForKey:@"content_url"] forKey:kContentURL];
        [newElement setValue:[NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]] forKey:kDate];
    }
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

@end
