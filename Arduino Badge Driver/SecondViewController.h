//
//  SecondViewController.h
//  Arduino Badge Driver
//
//  Created by Kelly John Rose on 2012-09-28.
//  Copyright (c) 2012 Kelly John Rose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *tweets;
}

- (void)fetchTweets;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
