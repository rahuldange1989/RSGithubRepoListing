//
//  GithubServices.m
//  GithubReposListing
//
//  Created by Rahul Dange on 24/07/20.
//  Copyright © 2020 Rahul Dange. All rights reserved.
//

#import "GithubServices.h"
#import <AFNetworking/AFNetworking.h>

#define GITHUB_BASE_URL @"https://api.github.com" // -- Github base url

@implementation GithubServices

///
/// The getGithubReposForUsername function aceepts username from user and
/// returns all github repos associated with that username.
///
/// - parameter username:  username for Github User
/// - parameter completionBlock: return all Github Repos using this block
/// - returns: void
///
- (void)getGithubReposForUsername:(NSString*)username completionBlock: (CompletionBlock)completionBlock
{
	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
		AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

	// -- remove white spaces from username if any
	username = [username stringByReplacingOccurrencesOfString:@" " withString:@""];
	NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/users/%@/repos", GITHUB_BASE_URL, username]];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];

	NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
		if (error) {
			// -- send 0 repos to user if API fails.
			completionBlock([[RSGithubRepos alloc] init]);
		} else {
			if (responseObject != nil) {
				NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:responseObject options:0 error:&error];
				RSGithubRepos *allRepos = RSGithubRepoFromData(jsonData, &error);
			
				if (error != nil) {
					// -- send 0 repos to user mapping JSON to Model fails.
					completionBlock([[RSGithubRepos alloc] init]);
				} else {
					// -- send all repos to user.
					completionBlock(allRepos);
				}
				
			} else {
				completionBlock([[RSGithubRepos alloc] init]);
			}
		}
	}];

	[dataTask resume];
}

@end
