//
//  Photo.m
//  Cats
//
//  Created by Katrina de Guzman on 2017-06-19.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithID:(NSString *)eyeD andOwner:(NSString *)owner andSecret:(NSString *)secret andServer:(NSString *)server andFarm:(NSNumber *)farm andTitle:(NSString *)title
{
    self = [super init];
    if (self)
    {
        _eyeD = eyeD;
        _owner = owner;
        _secret = secret;
        _server = server;
        _farm = farm;
        _title = title;
    }
    return self;
}

@end
