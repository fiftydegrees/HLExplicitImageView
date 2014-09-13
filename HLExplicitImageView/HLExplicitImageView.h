//
//  HLExplicitImageView.h
//  HLExplicitImageViewSample
//
//  Created by Hervé Heurtault de Lammerville on 13/09/14.
//  Copyright (c) 2014 Hervé HEURTAULT DE LAMMERVILLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLExplicitImageView;
@protocol HLExplicitImageViewDelegate <NSObject>
@optional
- (void)explicitImageViewFinallySucceded:(HLExplicitImageView *)imageView;
@end

@interface HLExplicitImageView : UIImageView

@property (nonatomic, assign) id<HLExplicitImageViewDelegate> delegate;

- (void)hl_setImageFromURL:(NSURL *)url;

@end
