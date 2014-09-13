//
//  HLExplicitImageView.m
//  HLExplicitImageViewSample
//
//  Created by Hervé Heurtault de Lammerville on 13/09/14.
//  Copyright (c) 2014 Hervé HEURTAULT DE LAMMERVILLE. All rights reserved.
//

#import "HLExplicitImageView.h"

#import "DACircularProgressView.h"
#import "SDWebImageManager.h"

@interface HLExplicitImageView ()
@property (nonatomic, strong) DACircularProgressView *circularProgressView;
@property (nonatomic, strong) UIButton *errorButton;
@property (nonatomic, strong) NSURL *url;
@end

@implementation HLExplicitImageView

@synthesize delegate;

- (void)hl_setImageFromURL:(NSURL *)url
{
    if (!_url &&
        [url isKindOfClass:[NSURL class]]) {
        _url = url;
    }
    
    if (!_url) {
        NSLog(@"-HLExplicitImageView.m- No URL passed as parameter.");
    }
    
    DACircularProgressView *progressView = _circularProgressView;
    if (!progressView)
    {
        CGFloat ratio = 0.7f;
        CGRect destinationFrame = CGRectMake(CGRectGetWidth(self.frame) * ratio / 2.0f,
                                             CGRectGetHeight(self.frame) * ratio / 2.0f,
                                             CGRectGetWidth(self.frame) * (1.0f - ratio),
                                             CGRectGetHeight(self.frame) * (1.0f - ratio));
        progressView = [[DACircularProgressView alloc] initWithFrame:destinationFrame];
        
        progressView.thicknessRatio = 0.2f;
        progressView.trackTintColor = [UIColor colorWithRed:52./255. green:73./255. blue:93./255. alpha:0.2f];
        progressView.progressTintColor = [UIColor colorWithRed:52./255. green:73./255. blue:93./255. alpha:0.8f];
    }
    
    [self addSubview:progressView];

    if (_errorButton) {
        _errorButton.hidden = YES;
    }
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:_url
                          options:0
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                             
                             CGFloat fProgress = ((CGFloat)receivedSize)/((CGFloat)expectedSize);
                             [progressView setProgress:fProgress animated:YES];
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            
                            [progressView removeFromSuperview];
                            
                            if (image &&
                                !error)
                            {
                                self.image = image;
                                
                                if ([url isKindOfClass:[UIButton class]] &&
                                    [delegate respondsToSelector:@selector(explicitImageViewFinallySucceded:)]) {
                                    [delegate explicitImageViewFinallySucceded:self];
                                }
                            }
                            else
                            {
                                if (!_errorButton)
                                {
                                    CGFloat ratio = 0.6f;
                                    CGRect destinationFrame = CGRectMake(CGRectGetWidth(self.frame) * ratio / 2.0f,
                                                                         CGRectGetHeight(self.frame) * ratio / 2.0f,
                                                                         CGRectGetWidth(self.frame) * (1.0f - ratio),
                                                                         CGRectGetHeight(self.frame) * (1.0f - ratio));
                                    _errorButton = [[UIButton alloc] initWithFrame:destinationFrame];
                                    
                                    self.userInteractionEnabled = YES;
                                    _errorButton.userInteractionEnabled = YES;
                                    _errorButton.contentMode = UIViewContentModeScaleToFill;
                                    [_errorButton setImage:[UIImage imageNamed:@"icon-retry.png"] forState:UIControlStateNormal];
                                    
                                    [_errorButton addTarget:self action:@selector(hl_setImageFromURL:) forControlEvents:UIControlEventTouchUpInside];
                                    
                                    [self addSubview:_errorButton];
                                    [self bringSubviewToFront:_errorButton];
                                }
                                else {
                                    _errorButton.hidden = NO;
                                }
                            }
                        }];
}

@end
