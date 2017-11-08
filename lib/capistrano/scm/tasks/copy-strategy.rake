
# This trick lets us access the Svn plugin within `on` blocks.
copy_strategy_plugin = self

namespace :copy_strategy do
  desc "Check server compatibility"
  task :check do
    on release_roles :all do
      copy_strategy_plugin.check_server
    end
  end
  desc "Copy repo to releases"
  task create_release: :'copy_strategy:update' do
  	on release_roles :all do
  	  within repo_path do 
  		copy_strategy_plugin.archive_to_release_path
  	  end
  	end
  end

  desc "Update code"
  task update: :'copy_strategy:clean' do
  	on release_roles :all do
      archive = copy_strategy_plugin.create_archive
      within repo_path do
       upload! archive, "."
      end
  	end
  end

  desc "Clean old revisions or initialize"
  task :clean do
  	on release_roles :all do
      within deploy_path do
      	copy_strategy_plugin.check_repo_dir
      end
    end
  end
end