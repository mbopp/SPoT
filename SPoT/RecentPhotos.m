//
//  RecentPhotos.m
//  SPoT
//
//  Created by Michael Bopp on 3/10/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import "RecentPhotos.h"
#import "FlickrFetcher.h"

@implementation RecentPhotos

#define RECENT_PHOTOS_KEY       @"recent_spot_photos"
#define VIEWED_PHOTO_TIMESTAMP  @"last_viewed"

+ (NSArray *)getRecentPhotos
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSArray *recentPhotos = [[NSUserDefaults standardUserDefaults] arrayForKey:RECENT_PHOTOS_KEY];
    if (!recentPhotos) {
        recentPhotos = [[NSArray alloc] init];
    }
    return recentPhotos;
}

+ (void)addPhotoToRecents:(NSDictionary *) photo
{
    NSMutableArray *photos = [[[self class] getRecentPhotos] mutableCopy];
    
    if ([photos containsObject:photo]) {
        NSLog(@"Removing %@", [photo valueForKey:FLICKR_PHOTO_TITLE]);
        [photos removeObject:photo];
    } else {
        if ([photos count] >= MAX_RECENT_PHOTOS) {
            [photos removeLastObject];
        }
    }
    
    // We can set the time like below, but we will then need to modify the way we search for an existing photo above,
    //   since the pointer will change when making mutable
    
//    NSMutableDictionary *viewedPhoto = [photo mutableCopy];
//    [viewedPhoto setObject:[NSDate date] forKey:VIEWED_PHOTO_TIMESTAMP];
    NSLog(@"Adding %@", [photo valueForKey:FLICKR_PHOTO_TITLE]);
    [photos insertObject:photo atIndex:0];
    
    [[NSUserDefaults standardUserDefaults] setObject:[photos copy] forKey:RECENT_PHOTOS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
