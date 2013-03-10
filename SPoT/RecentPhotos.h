//
//  RecentPhotos.h
//  SPoT
//
//  Created by Michael Bopp on 3/10/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecentPhotos : NSObject

+ (NSArray *)recentPhotos;
+ (void)addPhotoToRecents:(NSDictionary *) photo;

@end