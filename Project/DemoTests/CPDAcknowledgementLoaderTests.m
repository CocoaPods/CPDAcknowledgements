//
//  CPDAcknowledgementLoaderTests.m
//  Demo Project
//
//  Created by Orta on 17/01/2014.
//  Copyright (c) 2014 CocoaPods. All rights reserved.
//

#import <CPDAcknowledgements/CPDAcknowledgementsLoader.h>
#import <CPDAcknowledgements/CPDAcknowledgement.h>

SpecBegin(CPDAcknowledgementsLoader)

describe(@"loadAcknowledgements with our fixtured data", ^{

    it(@"returns an array", ^{
        NSArray *values = [CPDAcknowledgementsLoader loadAcknowledgementsWithBundle:[NSBundle mainBundle]];
        expect([values isKindOfClass:NSArray.class]).to.beTruthy();
    });

    it(@"it creates CPDAcknowledgements first", ^{
        NSArray *values = [CPDAcknowledgementsLoader loadAcknowledgementsWithBundle:[NSBundle mainBundle]];
        CPDAcknowledgement *acknowledgement = values[0];

        expect(acknowledgement.title).to.equal(@"CPDAcknowledgements");
        expect([acknowledgement.license hasPrefix:@"Copyright"]).to.beTruthy();

    });
});

SpecEnd
