//
//  ImageViewController.m
//  SPoT
//
//  Created by Michael Bopp on 3/9/13.
//  Copyright (c) 2013 Michael Bopp. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic) BOOL userDidZoom;

@end

@implementation ImageViewController

- (void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    [self resetImage];
}

- (void)resetImage
{
    if (self.scrollView) {
        self.scrollView.contentSize = CGSizeZero;
        self.imageView.image = nil;
        self.userDidZoom = NO;
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:self.imageURL];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        if (image) {
            self.scrollView.zoomScale = 1.0;  // be sure to reset
            self.scrollView.contentSize = image.size;
            self.imageView.image = image;
            self.imageView.frame = CGRectMake(0,0, image.size.width, image.size.height);
        }        
    }
}

- (void)viewDidLayoutSubviews
{
    [self autoZoom];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    self.userDidZoom = YES;
}

- (void)autoZoom
{
    if (self.imageView.image && !self.userDidZoom) { 
        CGFloat widthRatio  = self.scrollView.bounds.size.width  / self.imageView.bounds.size.width;
        CGFloat heightRatio = self.scrollView.bounds.size.height / self.imageView.bounds.size.height;
        self.scrollView.zoomScale = (widthRatio < heightRatio) ? widthRatio : heightRatio;
        self.userDidZoom = NO; 
    }
}


- (UIImageView *)imageView
{
    if (!_imageView) _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    return _imageView;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView]; // make this generic scroll view contain an image
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 5.0;
    self.scrollView.delegate = self;
    [self resetImage];
}

@end
