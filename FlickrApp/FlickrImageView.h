//
//  FlickrImageView.h
//  FlickrApp
//
//  Created by Cristina on 20/10/16.
//  Copyright © 2016 Cristina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrImageView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *flickrImage;
@property (weak, nonatomic) IBOutlet UILabel *flickrTitle;
@property (weak, nonatomic) IBOutlet UILabel *flickrDescription;
@property (weak, nonatomic) IBOutlet UILabel *flickrOwner;
@property (weak, nonatomic) IBOutlet UILabel *flickrDate;

@end
