//
//  DescriptionClass.h
//  FlickrApp
//
//  Created by Cristina on 19/10/16.
//  Copyright © 2016 Cristina. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DescriptionClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *content;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
