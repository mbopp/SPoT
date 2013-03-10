//
//  RecentFlickrPhotoTVC.m
//  SPoT
//
//  Created by Michael Bopp on 3/10/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import "RecentFlickrPhotoTVC.h"
#import "RecentPhotos.h"

@interface RecentFlickrPhotoTVC ()

@end

@implementation RecentFlickrPhotoTVC

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.photos = [RecentPhotos getRecentPhotos];
}

@end
