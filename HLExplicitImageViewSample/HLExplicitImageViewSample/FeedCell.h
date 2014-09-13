//
//  FeedCell.h
//  HLExplicitImageViewSample
//
//  Created by Hervé Heurtault de Lammerville on 12/09/14.
//  Copyright (c) 2014 Hervé HEURTAULT DE LAMMERVILLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLExplicitImageView;

@interface FeedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet HLExplicitImageView *contributionImageView;

@end
