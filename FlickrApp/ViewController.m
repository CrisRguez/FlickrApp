//
//  ViewController.m
//  FlickrApp
//
//  Created by Cristina on 19/10/16.
//  Copyright © 2016 Cristina. All rights reserved.
//

#import "ViewController.h"
#import "FlickrImageView.h"
#import <FlickrFramework/ServiceManager.h>
#import "Photo.h"

// TODO set lauchscreen to add image and set view in landscape
// TODO set storyboard in landscape (using StackView?)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet FlickrImageView *firstFlickrView;
@property (weak, nonatomic) IBOutlet FlickrImageView *secondFlickrView;
@property (weak, nonatomic) NSArray *flickrImageArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.flickrImageArray) {
        [self fetchFlickrInfo];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)setFlickrImageArray:(NSArray *)flickrImageArray {
    if (_flickrImageArray != flickrImageArray) {
        _flickrImageArray = flickrImageArray;
        [self setUpView];
    }
}

- (void)setUpView {
    if (self.flickrImageArray.count > 1) {
        Photo *photo = self.flickrImageArray[0];
        self.firstFlickrView.flickrTitle.text = photo.title;
        self.firstFlickrView.flickrOwner.text = photo.owner;
        
        Photo *secondPhoto = self.flickrImageArray[1];
        self.secondFlickrView.flickrTitle.text = secondPhoto.title;
        self.secondFlickrView.flickrOwner.text = secondPhoto.owner;
        
        // TODO continue changes
        // TODO Download images from url
    }
    
}

- (void)fetchFlickrInfo {
    dispatch_queue_t fetchQ = dispatch_queue_create("Flickr fetcher", NULL);
    dispatch_async(fetchQ, ^{
        NSArray *array = [ServiceManager getRecentPhotosInPage:2 andNumber:2];
        NSMutableArray *auxArray = [NSMutableArray array];
        // TODO implement sort algoritm
        for (NSDictionary *dictionary in array) {
            if ([dictionary isKindOfClass:[NSDictionary class]]) {
                Photo *photo = [Photo modelObjectWithDictionary:dictionary];
                [auxArray addObject:photo];
                
                // TODO create Core Data database and update it
            }
        }
        self.flickrImageArray = auxArray;
    });
}

@end
