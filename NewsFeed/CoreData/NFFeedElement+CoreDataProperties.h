//
//  NFFeedElement+CoreDataProperties.h
//  
//
//  Created by Maks on 4/10/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NFFeedElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface NFFeedElement (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *contentURL;
@property (nullable, nonatomic, retain) NSString *imageThumb;
@property (nullable, nonatomic, retain) NSString *elementID;
@property (nullable, nonatomic, retain) NSString *imageMedium;
@property (nullable, nonatomic, retain) NSString *date;

@end

NS_ASSUME_NONNULL_END
