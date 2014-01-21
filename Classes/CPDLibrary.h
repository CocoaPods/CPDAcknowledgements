//
//  CPDAcknowledgement.h
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

@interface CPDLibrary : NSObject

/// Create a library given the default (as of CP 0.30) information
/// from 

- (id)initWithCocoaPodsMetadataPlistDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *licenseBody;
@property (nonatomic, copy) NSString *licenseType;

@property (nonatomic, copy) NSArray  *authors;
@property (nonatomic, copy) NSString *socialMediaAddress;
@property (nonatomic, copy) NSString *libraryDescription;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *websiteAddress;

/// Actionable titles for platform dependent views
- (NSArray *)actionTitlesForLibrary;

/// Perform actions from given titles
- (void)performActionAtIndex:(NSInteger)index;

@end
