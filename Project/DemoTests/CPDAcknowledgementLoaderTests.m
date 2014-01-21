//
//  CPDAcknowledgementLoaderTests.m
//  Demo Project
//
//  Created by Orta on 17/01/2014.
//  Copyright (c) 2014 CocoaPods. All rights reserved.
//

#import <CPDAcknowledgements/CPDCocoaPodsLibrariesLoader.h>
#import <CPDAcknowledgements/CPDLibrary.h>

SpecBegin(CPDAcknowledgementsLoader)

describe(@"loadAcknowledgements with our fixtured data", ^{

    it(@"returns an array", ^{
        NSArray *values = [CPDCocoaPodsLibrariesLoader loadAcknowledgementsWithBundle:[NSBundle mainBundle]];
        expect([values isKindOfClass:NSArray.class]).to.beTruthy();
    });

    it(@"it creates CPDAcknowledgements with real data", ^{
        NSArray *values = [CPDCocoaPodsLibrariesLoader loadAcknowledgementsWithBundle:[NSBundle mainBundle]];
        CPDLibrary *acknowledgement = values[0];

        expect(acknowledgement.title).to.equal(@"CPDAcknowledgements");
        expect(acknowledgement.licenseType).to.equal(@"MIT");
    });
});

SpecEnd
