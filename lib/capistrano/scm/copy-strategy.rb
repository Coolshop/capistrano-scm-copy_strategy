require "capistrano/scm/plugin"

# By convention, Capistrano plugins are placed in the
# Capistrano namespace. This is completely optional.
module Capistrano
  class SCM::CopyStrategy < ::Capistrano::SCM::Plugin
    def set_defaults
      # Define any variables needed to configure the plugin.
      # set_if_empty :myvar, "my-default-value"
    end

    def register_hooks
    	after "deploy:new_release_path", "copy_strategy:create_release"
    	before "deploy:check", "copy_strategy:check"
    end

    def define_tasks
    	eval_rakefile File.expand_path("../tasks/copy-strategy.rake", __FILE__)
  	end

  	def check_server
  		backend.test :tar, "--version"
  	end

  	def check_repo_dir
  		if !backend.test " [ -d #{repo_path} ] "
  			backend.execute :mkdir, "-p", repo_path
  		else
  			backend.test :rm, "#{repo_path}/*"  		
  		end
  	end

  	def upload
  		warn sh 'git status'
  	end

  	def done
  		warn "bello, :ma, :non, :bellissimo"
  	end
  end
end
