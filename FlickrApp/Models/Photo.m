//
//  Photo.m
//  FlickrApp
//
//  Created by Cristina on 19/10/16.
//  Copyright © 2016 Cristina. All rights reserved.
//

#import "Photo.h"
#import "DescriptionClass.h"


NSString *const kPhotoSecret = @"secret";
NSString *const kPhotoId = @"id";
NSString *const kPhotoIsfamily = @"isfamily";
NSString *const kPhotoIspublic = @"ispublic";
NSString *const kPhotoFarm = @"farm";
NSString *const kPhotoDescription = @"description";
NSString *const kPhotoOwner = @"owner";
NSString *const kPhotoServer = @"server";
NSString *const kPhotoDateupload = @"dateupload";
NSString *const kPhotoTitle = @"title";
NSString *const kPhotoIsfriend = @"isfriend";
NSString *const kPhotoUrlSq = @"url_sq";
NSString *const kPhotoOwnername = @"ownername";
NSString *const kPhotoHeightSq = @"height_sq";
NSString *const kPhotoWidthSq = @"width_sq";


@interface Photo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Photo

@synthesize secret = _secret;
@synthesize photoIdentifier = _photoIdentifier;
@synthesize isfamily = _isfamily;
@synthesize ispublic = _ispublic;
@synthesize farm = _farm;
@synthesize photoDescription = _photoDescription;
@synthesize owner = _owner;
@synthesize server = _server;
@synthesize dateupload = _dateupload;
@synthesize title = _title;
@synthesize isfriend = _isfriend;
@synthesize urlSq = _urlSq;
@synthesize ownername = _ownername;
@synthesize heightSq = _heightSq;
@synthesize widthSq = _widthSq;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.secret = [self objectOrNilForKey:kPhotoSecret fromDictionary:dict];
            self.photoIdentifier = [self objectOrNilForKey:kPhotoId fromDictionary:dict];
            self.isfamily = [[self objectOrNilForKey:kPhotoIsfamily fromDictionary:dict] doubleValue];
            self.ispublic = [[self objectOrNilForKey:kPhotoIspublic fromDictionary:dict] doubleValue];
            self.farm = [[self objectOrNilForKey:kPhotoFarm fromDictionary:dict] doubleValue];
            self.photoDescription = [DescriptionClass modelObjectWithDictionary:[dict objectForKey:kPhotoDescription]];
            self.owner = [self objectOrNilForKey:kPhotoOwner fromDictionary:dict];
            self.server = [self objectOrNilForKey:kPhotoServer fromDictionary:dict];
            self.dateupload = [self objectOrNilForKey:kPhotoDateupload fromDictionary:dict];
            self.title = [self objectOrNilForKey:kPhotoTitle fromDictionary:dict];
            self.isfriend = [[self objectOrNilForKey:kPhotoIsfriend fromDictionary:dict] doubleValue];
            self.urlSq = [self objectOrNilForKey:kPhotoUrlSq fromDictionary:dict];
            self.ownername = [self objectOrNilForKey:kPhotoOwnername fromDictionary:dict];
            self.heightSq = [[self objectOrNilForKey:kPhotoHeightSq fromDictionary:dict] doubleValue];
            self.widthSq = [[self objectOrNilForKey:kPhotoWidthSq fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.secret forKey:kPhotoSecret];
    [mutableDict setValue:self.photoIdentifier forKey:kPhotoId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isfamily] forKey:kPhotoIsfamily];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ispublic] forKey:kPhotoIspublic];
    [mutableDict setValue:[NSNumber numberWithDouble:self.farm] forKey:kPhotoFarm];
    [mutableDict setValue:[self.photoDescription dictionaryRepresentation] forKey:kPhotoDescription];
    [mutableDict setValue:self.owner forKey:kPhotoOwner];
    [mutableDict setValue:self.server forKey:kPhotoServer];
    [mutableDict setValue:self.dateupload forKey:kPhotoDateupload];
    [mutableDict setValue:self.title forKey:kPhotoTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isfriend] forKey:kPhotoIsfriend];
    [mutableDict setValue:self.urlSq forKey:kPhotoUrlSq];
    [mutableDict setValue:self.ownername forKey:kPhotoOwnername];
    [mutableDict setValue:[NSNumber numberWithDouble:self.heightSq] forKey:kPhotoHeightSq];
    [mutableDict setValue:[NSNumber numberWithDouble:self.widthSq] forKey:kPhotoWidthSq];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.secret = [aDecoder decodeObjectForKey:kPhotoSecret];
    self.photoIdentifier = [aDecoder decodeObjectForKey:kPhotoId];
    self.isfamily = [aDecoder decodeDoubleForKey:kPhotoIsfamily];
    self.ispublic = [aDecoder decodeDoubleForKey:kPhotoIspublic];
    self.farm = [aDecoder decodeDoubleForKey:kPhotoFarm];
    self.photoDescription = [aDecoder decodeObjectForKey:kPhotoDescription];
    self.owner = [aDecoder decodeObjectForKey:kPhotoOwner];
    self.server = [aDecoder decodeObjectForKey:kPhotoServer];
    self.dateupload = [aDecoder decodeObjectForKey:kPhotoDateupload];
    self.title = [aDecoder decodeObjectForKey:kPhotoTitle];
    self.isfriend = [aDecoder decodeDoubleForKey:kPhotoIsfriend];
    self.urlSq = [aDecoder decodeObjectForKey:kPhotoUrlSq];
    self.ownername = [aDecoder decodeObjectForKey:kPhotoOwnername];
    self.heightSq = [aDecoder decodeDoubleForKey:kPhotoHeightSq];
    self.widthSq = [aDecoder decodeDoubleForKey:kPhotoWidthSq];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_secret forKey:kPhotoSecret];
    [aCoder encodeObject:_photoIdentifier forKey:kPhotoId];
    [aCoder encodeDouble:_isfamily forKey:kPhotoIsfamily];
    [aCoder encodeDouble:_ispublic forKey:kPhotoIspublic];
    [aCoder encodeDouble:_farm forKey:kPhotoFarm];
    [aCoder encodeObject:_photoDescription forKey:kPhotoDescription];
    [aCoder encodeObject:_owner forKey:kPhotoOwner];
    [aCoder encodeObject:_server forKey:kPhotoServer];
    [aCoder encodeObject:_dateupload forKey:kPhotoDateupload];
    [aCoder encodeObject:_title forKey:kPhotoTitle];
    [aCoder encodeDouble:_isfriend forKey:kPhotoIsfriend];
    [aCoder encodeObject:_urlSq forKey:kPhotoUrlSq];
    [aCoder encodeObject:_ownername forKey:kPhotoOwnername];
    [aCoder encodeDouble:_heightSq forKey:kPhotoHeightSq];
    [aCoder encodeDouble:_widthSq forKey:kPhotoWidthSq];
}

- (id)copyWithZone:(NSZone *)zone
{
    Photo *copy = [[Photo alloc] init];
    
    if (copy) {

        copy.secret = [self.secret copyWithZone:zone];
        copy.photoIdentifier = [self.photoIdentifier copyWithZone:zone];
        copy.isfamily = self.isfamily;
        copy.ispublic = self.ispublic;
        copy.farm = self.farm;
        copy.photoDescription = [self.photoDescription copyWithZone:zone];
        copy.owner = [self.owner copyWithZone:zone];
        copy.server = [self.server copyWithZone:zone];
        copy.dateupload = [self.dateupload copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.isfriend = self.isfriend;
        copy.urlSq = [self.urlSq copyWithZone:zone];
        copy.ownername = [self.ownername copyWithZone:zone];
        copy.heightSq = self.heightSq;
        copy.widthSq = self.widthSq;
    }
    
    return copy;
}


@end
