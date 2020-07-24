//
//  RSGithubRepoListingTests.m
//  RSGithubRepoListingTests
//
//  Created by Rahul Dange on 23/07/20.
//  Copyright © 2020 Rahul Dange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking.h>
#import "GithubServices.h"

@interface RSGithubRepoListingTests : XCTestCase

@end

@implementation RSGithubRepoListingTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
	[super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
	[super tearDown];
}

// -- Test Frameworks API
- (void)testGithubRepoListingAPIWorks {
	
	NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/users/AFNetworking/repos"]];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];

	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
	AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
	
	NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
		XCTAssertNil(responseObject, @"API failed to get Github Repos for user AFNetworking");
	}];

	[dataTask resume];
	
}

// -- Test Frameworks API call
- (void)testFrameworkAPICall {
    
	GithubServices *services = [[GithubServices alloc] init];
	[services getGithubReposForUsername:@"AFNetworking" completionBlocl:^(RSGithubRepos * allRepos) {
		XCTAssertEqual([allRepos count], 22, @"Framework's API Not working properly.");
	}];
	
}

@end
