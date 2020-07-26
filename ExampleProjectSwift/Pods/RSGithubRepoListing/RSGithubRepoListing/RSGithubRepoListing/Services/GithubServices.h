//
//  GithubServices.h
//  GithubReposListing
//
//  Created by Rahul Dange on 24/07/20.
//  Copyright © 2020 Rahul Dange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSGithubRepo.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^CompletionBlock)(RSGithubRepos*);

@interface GithubServices : NSObject

- (void)getGithubReposForUsername:(NSString*)username completionBlock: (CompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
