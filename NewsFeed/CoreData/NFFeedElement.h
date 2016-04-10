//
//  NFFeedElement.h
//  
//
//  Created by Maks on 4/10/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

static NSString *const kTitle = @"title";
static NSString *const kContentURL = @"contentURL";
static NSString *const kImageThumb = @"imageThumb";
static NSString *const kImageMedium = @"imageMedium";
static NSString *const kElementID = @"elementID";
static NSString *const kDate = @"date";

NS_ASSUME_NONNULL_BEGIN

@interface NFFeedElement : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "NFFeedElement+CoreDataProperties.h"
