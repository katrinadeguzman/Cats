//
//  CellImage.h
//  Cats
//
//  Created by Katrina de Guzman on 2017-06-20.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellImage : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *catImage;
@property (weak, nonatomic) IBOutlet UILabel *caption;

@end
