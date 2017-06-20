//
//  Photo.m
//  Cats
//
//  Created by Katrina de Guzman on 2017-06-19.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithServer: (NSString *)server andFarm: (NSNumber *)farm andId: (NSString *)ID andSecret: (NSString *)secret andTitle: (NSString *)title
{
    self = [super init];
    _server = server;
    _farm = farm;
    _ID = ID;
    _secret = secret;
    _title = title;
    NSString *string = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg", _farm, _server, _ID, _secret];
    _urlString = string;
    return self;
}

@end
