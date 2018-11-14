//
//  HWCommnetsCollectionViewCell.h
//  HomeWorkers
//
//  Created by apple on 17/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWCommnetsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *memberName;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UIImageView *ratingView;

@end
