//
// CPDLibraryTests
// Created by orta on 19/01/2014.
//
//  Copyright (c) 2014 http://artsy.net. All rights reserved.

#import <CPDAcknowledgements/CPDLibrary.h>
#import "CPDLibrary.h"

CPDLibrary *libraryWithDictionary(NSDictionary *dictionary);

SpecBegin(CPDLibrary)

describe(@"loading from dictionary", ^{
    it(@"sets expected values", ^{
        CPDLibrary *library = libraryWithDictionary( @{
                @"CPDName": @"Name",
                @"CPDLicenseText": @"LicenseText",
                @"CPDLicenseType": @"LicenseType",
                @"CPDSocialMediaURL": @"SocialMediaURL",
                @"CPDDescription": @"Description",
                @"CPDVersion": @"Version",
                @"CPDSummary" : @"Summary"
        });

        expect(library.title).to.equal(@"Name");
        expect(library.licenseBody).to.equal(@"LicenseText");
        expect(library.licenseType).to.equal(@"LicenseType");
        expect(library.socialMediaAddress).to.equal(@"SocialMediaURL");
        expect(library.libraryDescription).to.equal(@"Description");
        expect(library.version).to.equal(@"Version");
        expect(library.summary).to.equal(@"Summary");

    });

    it(@"handles NSString author name correctly", ^{
        CPDLibrary *library = libraryWithDictionary( @{
                @"CPDAuthors": @"Name",
        });

        expect(library.authors.count).to.equal(1);
        expect([library.authors[0] name]).to.equal(@"Name");
    });

    it(@"handles NSDictionary authors correctly", ^{
        CPDLibrary *library = libraryWithDictionary( @{
            @"CPDAuthors": @{ @"Key": @"Value" },
        });

        expect(library.authors.count).to.equal(1);
        expect([library.authors[0] name]).to.equal(@"Key");
        expect([library.authors[0] websiteAddress]).to.equal(@"mailto:Value");
    });

    it(@"handles multiple NSDictionary authors correctly", ^{
        CPDLibrary *library = libraryWithDictionary( @{
            @"CPDAuthors": @{ @"Key": @"Value", @"Key2" : @"Value2" },
        });
        expect(library.authors.count).to.equal(2);
    });
});

describe(@"action items", ^{
    it(@"shows twitter urls for social", ^{

        CPDLibrary *library = libraryWithDictionary( @{
            @"CPDSocialMediaURL": @"https://twitter.com/orta"
        });

        NSArray *actions = library.actionTitlesForLibrary;
        expect(actions.count).to.equal(1);
        expect(actions[0]).to.equal(@"@orta");
    });

//    it(@"shows website if one exists", ^{
//        CPDLibrary *library = libraryWithDictionary( @{
//            @"CPDSocialMediaURL": @"https://twitter.com/orta"
//        });
//
//        NSArray *actions = library.actionTitlesForLibrary;
//        expect(actions.count).to.equal(1);
//        expect(actions[0]).to.equal(@"@orta");
//    });

    describe(@"with a project author", ^{
       it(@" says email author for 1 author", ^{
           CPDLibrary *library = libraryWithDictionary( @{
               @"CPDAuthors": @"Name",
           });

           NSArray *actions = library.actionTitlesForLibrary;
           expect(actions.count).to.equal(1);
           expect(actions[0]).to.contain(@"Author");
       });

        it(@" says email author for 1 author", ^{
            CPDLibrary *library = libraryWithDictionary( @{
                @"CPDAuthors": @{ @"Key": @"Value", @"Key2" : @"Value2" },
            });

            NSArray *actions = library.actionTitlesForLibrary;
            expect(actions.count).to.equal(1);
            expect(actions[0]).to.contain(@"Authors");
        });
    });

    describe(@"calling actions", ^{
        CPDLibrary *library = libraryWithDictionary( @{
            @"CPDSocialMediaURL": @"https://twitter.com/orta",
            @"CPDAuthors": @{ @"Key": @"Value", @"Key2" : @"Value2"} ,
        });

        NSString *mailIndex = 0;

        it(@"handles opening emails", ^{

        });
    });
});


SpecEnd

CPDLibrary *libraryWithDictionary(NSDictionary *dictionary){
    return [[CPDLibrary alloc] initWithCocoaPodsMetadataPlistDictionary:dictionary];
}