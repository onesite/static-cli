#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require "rake"
require 'rake/clean'
require "static/version"

task :default => :build

desc "Run specs"
task :spec => ["bundler:install", "test:spec"]

task :build do
  sh "gem build static.gemspec"
end

task :install => :build do
  sh "gem install --local static-#{Static::Cmd::VERSION}.gem"
end

task :uninstall do
  sh "gem uninstall static"
end

task :reinstall => [:uninstall, :install]

task :release => :build do
  sh "gem push static-#{Static::Cmd::VERSION}.gem"
end

namespace "bundler" do
  task "install" do
    sh("bundle install")
  end
end

namespace "test" do
  task "spec" do |t|
     sh("cd spec && bundle exec rake spec")
  end
end

CLEAN.include [
  '.bundle', '*.gem'
]
