

if File.directory?(node['rockmongo']['docroot']) == false

	docrootPath = ""

	node['rockmongo']['docroot'].split('/').each do |folder|
		docrootPath = docrootPath + folder + "/"

		if File.directory?(docrootPath) == false
			FileUtils.mkdir(docrootPath)
		end
	end

	pathToCopy = run_context.cookbook_collection[cookbook_name].root_dir + "/files/rockmongo/."
	
	FileUtils.cp_r(pathToCopy, node['rockmongo']['docroot'])
	FileUtils.chown_R node['rockmongo']['user'], node['rockmongo']['group'], node['rockmongo']['docroot']
end