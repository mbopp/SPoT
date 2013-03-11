//
//  FlickrTagsTVC.m
//  SPoT
//
//  Created by Michael Bopp on 3/11/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import "FlickrTagsTVC.h"
#import "FlickrFetcher.h"

#define EXCLUDE_FLICKR_TAGS @[@"cs193pspot", @"portrait", @"landscape"]

@interface FlickrTagsTVC ()

@property (strong, nonatomic) NSArray *photos; // Array of NSDictionaries
@property (strong, nonatomic) NSArray *tags;   // Array of NSDictionaries

@end

@implementation FlickrTagsTVC

// If photos hasn't been set yet, fetch Stanford photos from Flickr using Professor Hagerty's Flickr Helper code.
- (NSArray *)photos
{
    if (!_photos) {
        _photos = [FlickrFetcher stanfordPhotos];
        self.tags = nil;
    }
    return _photos;
}

// If tags hasn't been set yet, set them to be the parsed tags. (which will use the photos to do so)
- (NSArray *)tags
{
    if (!_tags) _tags = [self parseTags];
    return _tags;
}

- (NSArray *)parseTags
{
    NSMutableArray *validTags = [[NSMutableArray alloc] init];
    
    for (NSDictionary *photo in self.photos) {
        
        for (NSString *tag in [photo[FLICKR_TAGS] componentsSeparatedByString:@" "]) {
            
            if ([EXCLUDE_FLICKR_TAGS containsObject:tag]) {
                continue;
            }
            
            NSDictionary *tagDict = [[NSDictionary alloc] initWithDictionary:[@{@"tag": tag} mutableCopy]];
            
            if (![validTags containsObject:tagDict]) {
                [validTags addObject:tagDict];                
            }
            
        }
    }
    
    return validTags;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tags count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Tag Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self titleForRow:indexPath.row];
    
    return cell;
}

- (NSString *)titleForRow:(NSUInteger)indexPath
{
    return [self.tags[indexPath] valueForKey:@"tag"];
}

#pragma mark - Table view delegate


@end
