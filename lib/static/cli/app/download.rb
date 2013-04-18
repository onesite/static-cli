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

require "vmc/cli/app/base"
require "pp"

module VMC::App
  class Download < Base
    desc "Download Application"
    group :apps, :manage
    input :app, :desc => "Application name",
          :argument => true, :from_given => by_name(:app)

    def download
      app = input[:app]

      download_app(app)

    rescue CFoundry::NotFound
      fail "Invalid #{b(app.name)}"
    rescue CFoundry::FileError => e
      fail e.description
    end

    private

    def download_app(app)
      with_progress("Downloading #{c(app.name, :name)}") do
        resp = client.base.get("apps", app.name, "application", :content => "application/octet-stream")

        if not resp.nil?
          File.open("#{app.name}.zip","w") { |f| f.puts resp }
        else
          raise
        end
      end
    rescue
      err "Download failed."
      raise
    end

  end
end