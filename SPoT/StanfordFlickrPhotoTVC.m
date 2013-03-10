//
//  StanfordFlickrPhotoTVC.m
//  SPoT
//
//  Created by Michael Bopp on 3/10/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import "StanfordFlickrPhotoTVC.h"
#import "FlickrFetcher.h"

@interface StanfordFlickrPhotoTVC ()

@end

@implementation StanfordFlickrPhotoTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photos = [FlickrFetcher stanfordPhotos];
}

@end
