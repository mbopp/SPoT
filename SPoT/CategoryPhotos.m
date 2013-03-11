//
//  CategoryPhotos.m
//  SPoT
//
//  Created by Michael Bopp on 3/11/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import "CategoryPhotos.h"
#import "FlickrFetcher.h"

@implementation CategoryPhotos

+ (NSArray *)photosForCategory:(NSDictionary *)photoCategory
{
    NSMutableArray *mutablePhotos = [[NSMutableArray alloc] init];
    for (NSDictionary *photo in [FlickrFetcher stanfordPhotos]) {
        
        for (NSString *tag in [photo[FLICKR_TAGS] componentsSeparatedByString:@" "]) {
            
            if ([[photoCategory valueForKey:@"tag"] isEqualToString:tag]) {
                [mutablePhotos addObject:photo];
            }
            
        }
    }
    NSLog(@"Photos for Category");
    return [mutablePhotos copy];
}

@end
