//
//  Photo.h
//  FlickrApp
//
//  Created by Cristina on 19/10/16.
//  Copyright © 2016 Cristina. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DescriptionClass;

@interface Photo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) NSString *photoIdentifier;
@property (nonatomic, assign) double isfamily;
@property (nonatomic, assign) double ispublic;
@property (nonatomic, assign) double farm;
@property (nonatomic, strong) DescriptionClass *photoDescription;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *server;
@property (nonatomic, strong) NSString *dateupload;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double isfriend;
@property (nonatomic, strong) NSString *urlSq;
@property (nonatomic, strong) NSString *ownername;
@property (nonatomic, assign) double heightSq;
@property (nonatomic, assign) double widthSq;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
