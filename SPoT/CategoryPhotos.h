//
//  CategoryPhotos.h
//  SPoT
//
//  Created by Michael Bopp on 3/11/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryPhotos : NSObject

+ (NSArray *)photosForCategory:(NSDictionary *)photoCategory;

@end
