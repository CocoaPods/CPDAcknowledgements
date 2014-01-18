//
//  CPDAcknowledgementsLoader.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDCocoaPodsLibrariesLoader.h"
#import "CPDLibrary.h"

@implementation CPDCocoaPodsLibrariesLoader

+ (NSArray *)loadAcknowledgementsWithBundle:(NSBundle *)bundle;
{
    NSString *path = [self pathForFirstFileWithSuffix:@"-acknowledgements.plist" inBundle:bundle];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    return [self acknowledgementsFromDictionary:dictionary];
}

+ (NSArray *)acknowledgementsFromDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *acknowledgements = [NSMutableArray array];
    NSArray *entries = dictionary[@"PreferenceSpecifiers"];
    NSArray *validEntires = [entries subarrayWithRange:NSMakeRange(1, entries.count - 2)];

    for (NSDictionary *entry in validEntires) {
        NSString *title = entry[@"Title"];
        NSString *body = entry[@"FooterText"];

        CPDLibrary *acknowledgement = [[CPDLibrary alloc] initWithTitle:title licenseBody:body];
        [acknowledgements addObject:acknowledgement];
    }
    return acknowledgements;
}

+ (NSString *)pathForFirstFileWithSuffix:(NSString *)suffix inBundle:(NSBundle *)bundle
{
    NSString *resourcesPath = [bundle resourcePath];
    NSArray *resources = [self filesOfDirectoryAtPath:resourcesPath];
    NSUInteger index = [resources indexOfObjectPassingTest:^BOOL(NSString *path, NSUInteger idx, BOOL *stop) {
        return [path hasSuffix:suffix];
    }];

    if(index == NSNotFound) return nil;

    NSString *path = resources[index];
    return [resourcesPath stringByAppendingPathComponent:path];
}

+ (NSArray *)filesOfDirectoryAtPath:(NSString *)path
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *contents = [manager contentsOfDirectoryAtPath:path error:&error];
    if (error) {
        NSLog(@"Error getting resources in main bundle - %@", error.localizedDescription);
    }
    return contents;
}

@end
