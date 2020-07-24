Pod::Spec.new do |spec|

  spec.name         = "RSGithubRepoListing"
  spec.version      = "0.0.2"
  spec.summary      = "To get Github Repos from username."
  spec.description  = "This framework helps to list out all Github Repositories associated with given username."
  spec.homepage     = "https://github.com/rahuldange1989/RSGithubRepoListing"
  spec.license      = "MIT"
  spec.author             = { "Rahul" => "rahul.dange1989@gmail.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/rahuldange1989/RSGithubRepoListing.git", :tag => "0.0.2" }
  spec.source_files  = "RSGithubRepoListing/RSGithubRepoListing/**/*.{h,m}"
  spec.requires_arc = true
  spec.dependency "AFNetworking", "4.0.0"

end
