//
//  ViewController.m
//  Cats
//
//  Created by Katrina de Guzman on 2017-06-19.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"

@interface ViewController ()

@property NSMutableArray* objects;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL* url = [NSURL URLWithString:@"https://www.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=b5fcd5986386c710cd2b319ff1082ddd&tags=cat"];
    
    NSURLRequest* urlRequest = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession* session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse* response, NSError* error)
    {
        if(error)
        {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        NSError* jsonError = nil;
        if(jsonError)
        {
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        NSDictionary* cats = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSDictionary* photos = cats[@"photos"];
        NSArray* photo = photos[@"photo"];
        self.objects = [[NSMutableArray alloc]init];
        NSMutableArray* catsArray = [[NSMutableArray alloc]init];
        for(NSDictionary* cat in photo)
        {
            NSString* eyeD = cat[@"id"];
            NSString* owner = cat[@"owner"];
            NSString* secret = cat[@"secret"];
            NSString* server = cat[@"server"];
            NSNumber* farm = cat[@"farm"];
            NSString* title = cat[@"title"];
            Photo* aCat = [[Photo alloc]initWithID:eyeD andOwner:owner andSecret:secret andServer:server andFarm:farm andTitle:title];
            [catsArray addObject:aCat];
            NSLog(@"~~~~~~~~~~~~~~~~~%@", aCat.title);
        }
        self.objects = catsArray;
                   }];
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}


@end
