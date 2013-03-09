//
//  FlickrPhotoTVC.h
//  SPoT
//
//  Created by Michael Bopp on 3/9/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//
// Will call setImageURL: as part of any "Show Image" segue

#import <UIKit/UIKit.h>

@interface FlickrPhotoTVC : UITableViewController

@property (nonatomic, strong) NSArray *photos; // of NSDictionary

@end
