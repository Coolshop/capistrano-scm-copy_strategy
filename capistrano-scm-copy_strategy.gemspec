Gem::Specification.new do |s|
  s.name        = 'capistrano-scm-copy_strategy'
  s.version     = '1.0.0'
  s.date        = '2017-04-10'
  s.summary     = "A copy strategy for Capistrano 3, which mimics the :copy scm of Capistrano 2."
  s.description = "This will make Capistrano tar the current directory, upload it to the server(s) and then extract it in the release directory."
  
  s.authors     = ["Alberto Brino"]
  s.email       = 'alberto.brino@gmail.com'
  s.homepage    =
    'http://www.albertobrino.com'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split("\n")
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency "capistrano", "~> 3.0"
end
