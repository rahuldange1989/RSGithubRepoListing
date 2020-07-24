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
	
	[self.view endEditing:true];
	NSString *username = [self.usernameField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
	
	GithubServices *services = [[GithubServices alloc] init];
	[services getGithubReposForUsername:username completionBlocl:^(RSGithubRepos * allRepos) {

		NSString *repoString = @"";
		
		if ([allRepos count] == 0)
		{
			repoString = @"No repos present.";
		}
		else
		{
			for (RSGithubRepoElement *repo in allRepos) {
				repoString = [repoString stringByAppendingFormat:@"- %@\n", [repo name]];
			}
		}
		
		dispatch_async(dispatch_get_main_queue(), ^{
			self.reposLabel.text = repoString;
			[self.reposLabel setHidden:false];
		});
	}];
	
}

@end
