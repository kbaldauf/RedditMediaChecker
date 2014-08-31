Gem::Specification.new do |s|
  s.name        = 'reddit_media_checker'
  s.version     = '0.0.1'
  s.date        = '2014-08-31'
  s.summary     = "Fetch list of Reddit links which contain a media."
  s.description = "This gem fetches a list of domains and permalinks from a certain number of pages of a Reddit feed that contain a valid media field."
  s.authors     = ["Kenneth Baldauf"]
  s.files       = ["lib/reddit_media_checker.rb"]
  s.homepage    = 'https://github.com/kbaldauf/RedditMediaChecker'
  s.license     = 'Apache v2.0'
  s.executables << 'reddit_media_checker'
end