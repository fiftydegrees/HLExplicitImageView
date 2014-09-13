//
//  FeedTVC.m
//  HLExplicitImageViewSample
//
//  Created by Hervé Heurtault de Lammerville on 12/09/14.
//  Copyright (c) 2014 Hervé HEURTAULT DE LAMMERVILLE. All rights reserved.
//

#import "FeedTVC.h"

#import "FeedCell.h"
#import "HLExplicitImageView.h"

@interface FeedTVC ()

@end

@implementation FeedTVC

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell"
                                                            forIndexPath:indexPath];
    
    [cell.contributionImageView hl_setImageFromURL:[NSURL URLWithString:@"http://img0.mxstatic.com/wallpapers/fc3704f2c4a958aca26f77f5d8b47852_large.jpeg"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 340.0f;
}

#pragma mark -
#pragma mark - HLExplicitImageView

- (void)imageViewAskedToRetry:(UIImageView *)imageView
{
    NSLog(@"Done");
}

@end
