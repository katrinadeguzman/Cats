//
//  Photo.h
//  Cats
//
//  Created by Katrina de Guzman on 2017-06-19.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic) NSString* eyeD;
@property (nonatomic) NSString* owner;
@property (nonatomic) NSString* secret;
@property (nonatomic) NSString* server;
@property (nonatomic) NSNumber* farm;
@property (nonatomic) NSString* title;

-(instancetype)initWithID:(NSString*)eyeD andOwner:(NSString*)owner andSecret:(NSString*)secret andServer:(NSString*)server andFarm:(NSNumber*)farm andTitle:(NSString*)title;
@end
