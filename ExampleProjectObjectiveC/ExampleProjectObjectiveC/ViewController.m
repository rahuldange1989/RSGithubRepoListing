//
//  ViewController.m
//  ExampleProjectObjectiveC
//
//  Created by Rahul Dange on 24/07/20.
//  Copyright © 2020 Rahul Dange. All rights reserved.
//

#import "ViewController.h"
#import <RSGithubRepoListing/RSGithubRepoListing.h>

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
	
	GithubServices *services = [[GithubServices alloc] init];
	[services getGithubReposForUsername:username completionBlocl:^(RSGithubRepos * allRepos) {
		
		if ([allRepos count] == 0)
		{
			self.reposLabel.text = @"No repos present.";
		}
		else
		{
			NSString *repoString = @"";
			for (RSGithubRepoElement *repo in allRepos) {
				repoString = [repoString stringByAppendingFormat:@"%@\n", [repo name]];
			}
			self.reposLabel.text = repoString;
		}
	}];
	
}

@end
