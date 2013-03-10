//
//  RecentPhotos.m
//  SPoT
//
//  Created by Michael Bopp on 3/10/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import "RecentPhotos.h"

@implementation RecentPhotos

#define RECENT_PHOTOS_KEY       @"recent_spot_photos"
#define VIEWED_PHOTO_TIMESTAMP  @"last_viewed"

+ (NSArray *)recentPhotos
{
    NSArray *recentPhotos = [[NSUserDefaults standardUserDefaults] arrayForKey:RECENT_PHOTOS_KEY];    
    return recentPhotos;
}

+ (void)addPhotoToRecents:(NSDictionary *) photo
{
    NSMutableArray *recentPhotos = [[RecentPhotos recentPhotos] mutableCopy];
    
    [recentPhotos addObject:photo];
    
    [[NSUserDefaults standardUserDefaults] setObject:recentPhotos forKey:RECENT_PHOTOS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
