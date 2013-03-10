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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photos = [RecentPhotos recentPhotos];
}

@end
