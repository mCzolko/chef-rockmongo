
web_app "rockmongo" do
  server_name node['rockmongo']['hostname']
  docroot node['rockmongo']['docroot']
end