# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fast_random/version"

Gem::Specification.new do |s|
  s.name        = "fast_random"
  s.version     = FastRandom::VERSION
  s.authors     = ["xdite"]
  s.email       = ["xuite.joke@gmail.com"]
  s.homepage    = "https://github.com/xdite/fast_random"
  s.summary     = %q{ultra fast order by rand() solution, see http://jan.kneschke.de/projects/mysql/order-by-rand/}
  s.description = %q{ultra fast order by rand() solution, see http://jan.kneschke.de/projects/mysql/order-by-rand/}

  s.rubyforge_project = "fast_random"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

