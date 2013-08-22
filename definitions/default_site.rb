#
# Cookbook Name:: apache2
# Definition:: web_app
#
# Copyright 2008-2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

define :default_site, :template => "my-default-site.conf.erb", :enable => true do

  application_name = params[:name]

  template "#{node['apache']['dir']}/sites-available/#{application_name}.conf" do
    source params[:template]
    owner "root"
    group node['apache']['root_group']
    mode 0644
    if params[:cookbook]
      cookbook params[:cookbook]
    end
    variables(
      :name => application_name,
      :params => params
    )
    if ::File.exists?("#{node['apache']['dir']}/sites-enabled/#{application_name}.conf")
      notifies :reload, resources(:service => "apache2"), :delayed
    end
  end

  site_enabled = params[:enable]
  apache_site "#{params[:name]}.conf" do
    enable site_enabled
  end
end