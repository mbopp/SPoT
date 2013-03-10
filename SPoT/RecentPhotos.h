//
//  RecentPhotos.h
//  SPoT
//
//  Created by Michael Bopp on 3/10/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_RECENT_PHOTOS 10

@interface RecentPhotos : NSObject

+ (NSArray *)getRecentPhotos;
+ (void)addPhotoToRecents:(NSDictionary *) photo;

@end
