# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require "rake"
require "static/version"

Gem::Specification.new do |s|
  s.name        = "static"
  s.version     = Static::Cmd::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Static Development"]
  s.email       = ["support@static.com"]
  s.homepage    = "http://www.static.com/"
  s.summary     = %q{ Static.com Cloud CLI }
  s.description = %q{ Static.com Cloud Command Line Client }
  s.licenses    = ["Apache v2.0"]
  s.executables = %w(static)
  
  s.rubyforge_project = "static"

  s.files         = %w{LICENSE README.md Rakefile} + 
                    FileList[Dir.glob("{lib,vendor,config}/**/*")].exclude("vendor/cache")
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.bindir  = ["bin"]
  s.require_paths = ["lib", "vendor"]
  s.test_files    = Dir.glob("spec/**/*")

  s.add_runtime_dependency "json_pure", "~> 1.6"
  s.add_runtime_dependency "multi_json", "~> 1.3"
  s.add_runtime_dependency "multipart-post", "~> 1.1"
  s.add_runtime_dependency "rubyzip", "~> 0.9"
  s.add_runtime_dependency "rest-client", "~> 1.6"
  s.add_runtime_dependency "interact", "~> 0.5"
  s.add_runtime_dependency "clouseau", "~> 0.0"
  s.add_runtime_dependency "addressable", "~> 2.2"
  s.add_runtime_dependency "uuidtools", "~> 2.1"

  s.add_runtime_dependency "mothership", ">= 0.5.1", "< 1.0"
  s.add_runtime_dependency "caldecott-client", "~> 0.0.2"
  s.add_runtime_dependency "cf-uaa-lib", "~> 1.3.8"

  s.add_development_dependency "rake", "~> 0.9"
  s.add_development_dependency "rspec", "~> 2.11"
  s.add_development_dependency "webmock", "~> 1.9"
  s.add_development_dependency "rr", "~> 1.0"

end
