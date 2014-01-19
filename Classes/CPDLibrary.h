//
//  CPDAcknowledgement.h
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

@interface CPDLibrary : NSObject

- (id)initWithCocoaPodsMetadataPlistDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *licenseBody;
@property (nonatomic, copy) NSString *licenseType;

@property (nonatomic, copy) NSArray  *authors;
@property (nonatomic, copy) NSString *socialMediaURL;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *version;

@end
