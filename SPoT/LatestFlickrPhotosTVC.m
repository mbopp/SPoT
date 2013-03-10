//
//  LatestFlickrPhotosTVC.m
//  SPoT
//
//  Created by Michael Bopp on 3/9/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import "LatestFlickrPhotosTVC.h"
#import "FlickrFetcher.h"

@interface LatestFlickrPhotosTVC ()

@end

@implementation LatestFlickrPhotosTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photos = [FlickrFetcher latestGeoreferencedPhotos];
}

@end
