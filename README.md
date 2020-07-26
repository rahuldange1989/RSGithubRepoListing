# RSGithubRepoListing
This framework accepts Github username and returns repos associated with it.

## Installation with CocoaPods
To integrate RSGithubRepoListing into your Xcode project using CocoaPods, specify it in your `Podfile`

```
pod 'RSGithubRepoListing', '~> 0.0.5'
```

# Usage
**Using Objective-C**

```
#import <RSGithubRepoListing/RSGithubRepoListing.h>

// In your custom function
GithubServices *services = [[GithubServices alloc] init];
[services getGithubReposForUsername:**required username** completionBlock:^(RSGithubRepos * allRepos) {
  // You will get all records in RSGithubRepos array.
}];
```

**Using Swift**

```
import RSGithubRepoListing

// In your custom function
let gitServices = GithubServices()
gitServices.getGithubRepos(forUsername: username) { [weak self] (allRepos) in
  // You will get all records in RSGithubRepos array.
}
```

# License
RSGithubRepoListing is released under the **MIT** license.
