//
//  Photo.h
//  Cats
//
//  Created by Katrina de Guzman on 2017-06-19.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Photo : NSObject

@property (nonatomic, strong) NSString *server;
@property (nonatomic, strong) NSNumber *farm;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, readonly, strong) NSString *urlString;
@property (nonatomic, strong) UIImage *catImage;

- (instancetype)initWithServer: (NSString *)server andFarm: (NSNumber *)farm andId: (NSString *)ID andSecret: (NSString *)secret andTitle: (NSString *)title;


@end
