//
//  StanfordFlickrPhotoTVC.m
//  SPoT
//
//  Created by Michael Bopp on 3/10/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import "StanfordFlickrPhotoTVC.h"
#import "CategoryPhotos.h"

@interface StanfordFlickrPhotoTVC ()

@end

@implementation StanfordFlickrPhotoTVC

- (void)setPhotoCategory:(NSDictionary *)photoCategory
{
    NSLog(@"Set Photo Category: %@", photoCategory);
    _photoCategory = photoCategory;
    [self resetTable];
}

- (void)resetTable
{
    self.photos = [CategoryPhotos photosForCategory:self.photoCategory];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self resetTable];
//    self.photos = [FlickrFetcher stanfordPhotos];
}

@end
