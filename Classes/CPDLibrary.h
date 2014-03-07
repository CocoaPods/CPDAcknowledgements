//
//  CPDAcknowledgement.h
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

@interface CPDLibrary : NSObject

/// Create a library given the default (as of CP 0.30) information
/// from the metadata.plist

- (id)initWithCocoaPodsMetadataPlistDictionary:(NSDictionary *)dictionary;

@property (readonly, nonatomic, copy) NSString *title;
@property (readonly, nonatomic, copy) NSString *licenseBody;
@property (readonly, nonatomic, copy) NSString *licenseType;
@property (readonly, nonatomic, copy) NSString *summary;

@property (readonly, nonatomic, copy) NSArray  *authors;
@property (readonly, nonatomic, copy) NSString *socialMediaAddress;
@property (readonly, nonatomic, copy) NSString *libraryDescription;
@property (readonly, nonatomic, copy) NSString *version;
@property (readonly, nonatomic, copy) NSString *websiteAddress;

/// Actionable titles for platform dependent views
- (NSArray *)actionTitlesForLibrary;

/// Perform actions from given titles
- (void)performActionAtIndex:(NSInteger)index;

@end
