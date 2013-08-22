puts run_context.cookbook_collection[cookbook_name].root_dir + "/files/rockmongo"


puts "Copiing rockmongo sources"

FileUtils.mkdir('/var/www/admin')
FileUtils.cp_r(run_context.cookbook_collection[cookbook_name].root_dir + "/files/rockmongo", '/var/www/admin/rockmongo')


default_site "admin" do
  server_name 'admin'
  docroot "/var/www/admin"
  enable true
end

default_site "rockmongo" do
  server_name 'admin.rockmongo'
  docroot "/var/www/admin/rockmongo"
  enable true
end