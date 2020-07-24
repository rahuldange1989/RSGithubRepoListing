//
//  ViewController.m
//  ExampleProjectObjectiveC
//
//  Created by Rahul Dange on 24/07/20.
//  Copyright © 2020 Rahul Dange. All rights reserved.
//

#import "ViewController.h"
#import <RSGithubRepoListing/RSGithubRepoListing.h>
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (IBAction)submitBtnClicked:(id)sender {
	
	NSString *username = [self.usernameField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
	[self.reposLabel setHidden:false];
	
//	GithubServices *services = [[GithubServices alloc] init];
//	[services getGithubReposForUsername:username completionBlocl:^(RSGithubRepos * allRepos) {
//
//		if ([allRepos count] == 0)
//		{
//			self.reposLabel.text = @"No repos present.";
//		}
//		else
//		{
//			NSString *repoString = @"";
//			for (RSGithubRepoElement *repo in allRepos) {
//				repoString = [repoString stringByAppendingFormat:@"%@\n", [repo name]];
//			}
//			self.reposLabel.text = repoString;
//		}
//	}];
	
	//if ([AFNetworkReachabilityManager sharedManager].reachable)
	//{
		NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
		AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

		// -- remove white spaces from username if any
		username = [username stringByReplacingOccurrencesOfString:@" " withString:@""];
		NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/users/%@/repos", username]];
		NSURLRequest *request = [NSURLRequest requestWithURL:URL];

		NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
			if (error) {
				// -- send 0 repos to user if API fails.
				
			} else {
				if (responseObject != nil) {
					NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:responseObject options:0 error:&error];
					RSGithubRepos *allRepos = RSGithubRepoFromData(jsonData, &error);
				
					if (error != nil) {
						// -- send 0 repos to user mapping JSON to Model fails.
						
					} else {
						// -- send all repos to user.
						NSString *repoString = @"";
						for (RSGithubRepoElement *repo in allRepos) {
							repoString = [repoString stringByAppendingFormat:@"- %@\n", [repo name]];
						}
						self.reposLabel.text = repoString;
					}
					
				} else {
					
				}
			}
		}];

		[dataTask resume];
//	}
//	else {
//		// -- send 0 repos to user as device is not connected to internet.
//		//completionBlock([[RSGithubRepos alloc] init]);
//	}
	
	
	
}

@end
