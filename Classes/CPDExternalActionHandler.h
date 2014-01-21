//
// CPDExternalActionHandler
// Created by orta on 21/01/2014.
//
//  Copyright (c) 2014 http://artsy.net. All rights reserved.

#import <Foundation/Foundation.h>

@class CPDLibrary;

@interface CPDExternalActionHandler : NSObject
+ (void)openActionForTwitterHandle:(NSString *)twitterUsername;
+ (void)openEmailSheetForAuthors:(NSArray *)authors ofLibrary:(CPDLibrary *)library;
+ (void)openAddressInBrowser:(NSString *)address;
@end