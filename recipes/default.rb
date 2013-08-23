

if File.directory?(node['rockmongo']['docroot']) == false

	docrootPath = ""

	node['rockmongo']['docroot'].split('/').each do |folder|
		docrootPath = docrootPath + folder + "/"

		if File.directory?(docrootPath) == false
			FileUtils.mkdir(docrootPath)
		end
	end

	FileUtils.cp_r(run_context.cookbook_collection[cookbook_name].root_dir + "/files/rockmongo", node['rockmongo']['docroot'])

end