//
//  TweetViewController.h
//  Arduino Badge Driver
//
//  Created by Kelly John Rose on 2012-09-29.
//  Copyright (c) 2012 Kelly John Rose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetViewController : UITableViewController
{
    NSArray *tweets;
}
@property (strong, nonatomic) IBOutlet UITableView *tweetTable;

@end
