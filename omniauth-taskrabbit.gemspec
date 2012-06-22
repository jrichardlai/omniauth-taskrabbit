# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/taskrabbit/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-taskrabbit'
  s.version  = OmniAuth::TaskRabbit::VERSION
  s.authors  = ['Jean-Richard Lai']
  s.email    = ['jrichardlai@gmail.com']
  s.summary  = 'Taskrabbit strategy for OmniAuth'
  s.homepage = 'https://github.com/jrichardlai/omniauth-taskrabbit'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.0.2'

  s.add_development_dependency 'rspec', '~> 2'
  s.add_development_dependency 'rake'
end
