//
//  SecondViewController.m
//  Arduino Badge Driver
//
//  Created by Kelly John Rose on 2012-09-28.
//  Copyright (c) 2012 Kelly John Rose. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@end

@implementation SecondViewController

@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self fetchTweets];  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchTweets
{
    ACAccountStore *store = [[ACAccountStore alloc] init];
    ACAccountType *twitterAccountType =
    [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    //  Request permission from the user to access the available Twitter accounts
    [store requestAccessToAccountsWithType:twitterAccountType
                     withCompletionHandler:^(BOOL granted, NSError *error) {
                         if (!granted) {
                             // The user rejected your request
                             NSLog(@"User rejected access to the account.");
                         }
                         else {
                             // Grab the available accounts
                             NSArray *twitterAccounts =
                             [store accountsWithAccountType:twitterAccountType];
                             
                             if ([twitterAccounts count] > 0) {
                                 // Use the first account for simplicity
                                 ACAccount *account = [twitterAccounts objectAtIndex:0];
                                 
                                 // Now make an authenticated request to our endpoint
                                 NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
                                 [params setObject:@"1" forKey:@"include_entities"];
                                 
                                 //  The endpoint that we wish to call
                                 NSURL *url =
                                 [NSURL
                                  URLWithString:@"http://api.twitter.com/1/statuses/mentions_timeline.json"];
                                 
                                 //  Build the request with our parameter
                                 TWRequest *request =
                                 [[TWRequest alloc] initWithURL:url
                                                     parameters:params
                                                  requestMethod:TWRequestMethodGET];
                                 
                                 // Attach the account object to this request
                                 [request setAccount:account];
                                 
                                 [request performRequestWithHandler:
                                  ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                      if (!responseData) {
                                          // inspect the contents of error 
                                          NSLog(@"%@", error);
                                      } 
                                      else {
                                          NSError *jsonError;
                                          NSArray *timeline = 
                                          [NSJSONSerialization 
                                           JSONObjectWithData:responseData 
                                           options:NSJSONReadingMutableLeaves 
                                           error:&jsonError];
                                          tweets = [NSJSONSerialization JSONObjectWithData:responseData
                                                                                   options:NSJSONReadingMutableLeaves
                                                                                     error:&jsonError];

                                          if (timeline) {                          
                                             [self.tableView reloadData];
                                          } 
                                          else { 
                                              // inspect the contents of jsonError
                                              NSLog(@"%@", jsonError);
                                          }
                                      }
                                  }];
                                 
                             } // if ([twitterAccounts count] > 0)
                         } // if (granted) 
                     }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tweetView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TweetCell";
    
    UITableViewCell *cell = [tweetView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
   // NSDictionary *tweet = [tweets objectAtIndex:indexPath.row];
    NSString *text = @"test";//[tweet objectForKey:@"text"];
    NSString *name = @"test";//[[tweet objectForKey:@"user"] objectForKey:@"name"];

    cell.textLabel.text = [NSString stringWithString:text];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"by %@", name];
    
    return cell;
}

@end
