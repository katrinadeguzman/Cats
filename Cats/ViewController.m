//
//  ViewController.m
//  Cats
//
//  Created by Katrina de Guzman on 2017-06-19.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"
#import "CellImage.h"
@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic) NSMutableArray *photosArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlString = @"https://www.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=b5fcd5986386c710cd2b319ff1082ddd&tags=cat";
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        if (!error)
        {
            NSError *jsonError = nil;
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            NSDictionary *photos = json[@"photos"];
            NSArray * photo = photos[@"photo"];
            
            self.photosArray = [NSMutableArray array];
            
            for (NSDictionary *eachPhoto in photo)
            {
                NSString *server = eachPhoto[@"server"];
                NSNumber *farm = eachPhoto[@"farm"];
                NSString *ID = eachPhoto[@"id"];
                NSString *secret = eachPhoto[@"secret"];
                NSString *title = eachPhoto[@"title"];
                
                Photo* aPhoto = [[Photo alloc] initWithServer:server andFarm:farm andId:ID andSecret:secret andTitle:title];
                
                [self.photosArray addObject:aPhoto];
            }
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.collectionView reloadData];
            }];
        }
    }];
    
    [dataTask resume];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photosArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CellImage *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    Photo *photo = self.photosArray[indexPath.item];
    
    NSString *stringTitle = [self.photosArray[indexPath.item] title];
    
    if(photo.catImage == nil)
    {
        
        NSString *imageURLString = [self.photosArray[indexPath.item] urlString];
        NSURL *url = [NSURL URLWithString:imageURLString];
        
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDownloadTask *downloadPhotoTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error)
        {
            NSData *data = [NSData dataWithContentsOfURL:url];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{CellImage * cell = (CellImage *)[collectionView cellForItemAtIndexPath:indexPath];
                photo.catImage = [UIImage imageWithData:data];
                cell.catImage.image = photo.catImage;}];
        }];
        [downloadPhotoTask resume];
    }
    else
    {
        cell.catImage.image = photo.catImage;
    }
    cell.caption.text = stringTitle;
    return cell;
}
- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}


@end
