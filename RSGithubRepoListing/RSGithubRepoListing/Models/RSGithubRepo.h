//
//  RSGithubRepo.h
//  GithubReposListing
//
//  Created by Rahul Dange on 23/07/20.
//  Copyright © 2020 Rahul Dange. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSGithubRepoElement;
@class RSOwner;

NS_ASSUME_NONNULL_BEGIN

typedef NSArray<RSGithubRepoElement *> RSGithubRepos;

#pragma mark - Top-level marshaling functions

RSGithubRepos *_Nullable RSGithubRepoFromData(NSData *data, NSError **error);
RSGithubRepos *_Nullable RSGithubRepoFromJSON(NSString *json, NSStringEncoding encoding, NSError **error);
NSData       *_Nullable RSGithubRepoToData(RSGithubRepos *githubRepo, NSError **error);
NSString     *_Nullable RSGithubRepoToJSON(RSGithubRepos *githubRepo, NSStringEncoding encoding, NSError **error);

#pragma mark - Object interfaces

@interface RSGithubRepoElement : NSObject
@property (nonatomic, assign)         NSInteger identifier;
@property (nonatomic, copy)           NSString *nodeID;
@property (nonatomic, copy)           NSString *name;
@property (nonatomic, copy)           NSString *fullName;
@property (nonatomic, assign)         BOOL isPrivate;
@property (nonatomic, strong)         RSOwner *owner;
@property (nonatomic, copy)           NSString *htmlURL;
@property (nonatomic, copy)           NSString *theDescription;
@property (nonatomic, assign)         BOOL isFork;
@property (nonatomic, copy)           NSString *url;
@property (nonatomic, copy)           NSString *forksURL;
@property (nonatomic, copy)           NSString *keysURL;
@property (nonatomic, copy)           NSString *collaboratorsURL;
@property (nonatomic, copy)           NSString *teamsURL;
@property (nonatomic, copy)           NSString *hooksURL;
@property (nonatomic, copy)           NSString *issueEventsURL;
@property (nonatomic, copy)           NSString *eventsURL;
@property (nonatomic, copy)           NSString *assigneesURL;
@property (nonatomic, copy)           NSString *branchesURL;
@property (nonatomic, copy)           NSString *tagsURL;
@property (nonatomic, copy)           NSString *blobsURL;
@property (nonatomic, copy)           NSString *gitTagsURL;
@property (nonatomic, copy)           NSString *gitRefsURL;
@property (nonatomic, copy)           NSString *treesURL;
@property (nonatomic, copy)           NSString *statusesURL;
@property (nonatomic, copy)           NSString *languagesURL;
@property (nonatomic, copy)           NSString *stargazersURL;
@property (nonatomic, copy)           NSString *contributorsURL;
@property (nonatomic, copy)           NSString *subscribersURL;
@property (nonatomic, copy)           NSString *subscriptionURL;
@property (nonatomic, copy)           NSString *commitsURL;
@property (nonatomic, copy)           NSString *gitCommitsURL;
@property (nonatomic, copy)           NSString *commentsURL;
@property (nonatomic, copy)           NSString *issueCommentURL;
@property (nonatomic, copy)           NSString *contentsURL;
@property (nonatomic, copy)           NSString *compareURL;
@property (nonatomic, copy)           NSString *mergesURL;
@property (nonatomic, copy)           NSString *archiveURL;
@property (nonatomic, copy)           NSString *downloadsURL;
@property (nonatomic, copy)           NSString *issuesURL;
@property (nonatomic, copy)           NSString *pullsURL;
@property (nonatomic, copy)           NSString *milestonesURL;
@property (nonatomic, copy)           NSString *notificationsURL;
@property (nonatomic, copy)           NSString *labelsURL;
@property (nonatomic, copy)           NSString *releasesURL;
@property (nonatomic, copy)           NSString *deploymentsURL;
@property (nonatomic, copy)           NSString *createdAt;
@property (nonatomic, copy)           NSString *updatedAt;
@property (nonatomic, copy)           NSString *pushedAt;
@property (nonatomic, copy)           NSString *gitURL;
@property (nonatomic, copy)           NSString *sshURL;
@property (nonatomic, copy)           NSString *cloneURL;
@property (nonatomic, copy)           NSString *svnURL;
@property (nonatomic, nullable, copy) id homepage;
@property (nonatomic, assign)         NSInteger size;
@property (nonatomic, assign)         NSInteger stargazersCount;
@property (nonatomic, assign)         NSInteger watchersCount;
@property (nonatomic, copy)           NSString *language;
@property (nonatomic, assign)         BOOL hasIssues;
@property (nonatomic, assign)         BOOL hasProjects;
@property (nonatomic, assign)         BOOL hasDownloads;
@property (nonatomic, assign)         BOOL hasWiki;
@property (nonatomic, assign)         BOOL hasPages;
@property (nonatomic, assign)         NSInteger forksCount;
@property (nonatomic, nullable, copy) id mirrorURL;
@property (nonatomic, assign)         BOOL isArchived;
@property (nonatomic, assign)         BOOL isDisabled;
@property (nonatomic, assign)         NSInteger openIssuesCount;
@property (nonatomic, nullable, copy) id license;
@property (nonatomic, assign)         NSInteger forks;
@property (nonatomic, assign)         NSInteger openIssues;
@property (nonatomic, assign)         NSInteger watchers;
@property (nonatomic, copy)           NSString *defaultBranch;
@end

@interface RSOwner : NSObject
@property (nonatomic, copy)   NSString *login;
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString *nodeID;
@property (nonatomic, copy)   NSString *avatarURL;
@property (nonatomic, copy)   NSString *gravatarID;
@property (nonatomic, copy)   NSString *url;
@property (nonatomic, copy)   NSString *htmlURL;
@property (nonatomic, copy)   NSString *followersURL;
@property (nonatomic, copy)   NSString *followingURL;
@property (nonatomic, copy)   NSString *gistsURL;
@property (nonatomic, copy)   NSString *starredURL;
@property (nonatomic, copy)   NSString *subscriptionsURL;
@property (nonatomic, copy)   NSString *organizationsURL;
@property (nonatomic, copy)   NSString *reposURL;
@property (nonatomic, copy)   NSString *eventsURL;
@property (nonatomic, copy)   NSString *receivedEventsURL;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, assign) BOOL isSiteAdmin;
@end

NS_ASSUME_NONNULL_END


