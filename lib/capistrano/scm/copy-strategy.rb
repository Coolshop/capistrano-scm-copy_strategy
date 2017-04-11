require "capistrano/scm/plugin"
require 'fileutils'
require 'tempfile' # Dir.tmpdir

# By convention, Capistrano plugins are placed in the
# Capistrano namespace. This is completely optional.
module Capistrano
  class SCM::CopyStrategy < ::Capistrano::SCM::Plugin
    def set_defaults
      # Define any variables needed to configure the plugin.
      set_if_empty :include_dir, "."
      set_if_empty :archive_name, "#{env.release_timestamp}.tar.gz"
      set_if_empty :temp_folder, "#{Dir.tmpdir}"

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

  	def create_archive
  		archive_name = fetch(:archive_name)
	    include_dir  = fetch(:include_dir)
	    exclude_dirs  = Array(fetch(:exclude_dirs))
	    exclude_dirs.push(archive_name)
	    temp_folder = fetch(:temp_folder)

	    warn temp_folder

	    FileUtils.copy_entry include_dir, "#{temp_folder}/#{env.release_timestamp}"

	    # sh "ls -al #{temp_folder}/#{env.release_timestamp}"
	    
	    exclude_dirs.map { |dir| FileUtils.rm_rf "#{temp_folder}/#{env.release_timestamp}/#{dir}" }

	    sh "ls -al #{temp_folder}/#{env.release_timestamp}"
	    
	    tar_verbose = fetch(:tar_verbose, true) ? "v" : ""

	    cmd = ["tar", "-c#{tar_verbose}zf", archive_name, "-C #{temp_folder}/#{env.release_timestamp}", '.']
		sh cmd.join(' ')
		return archive_name
  	end


  	def archive_to_release_path
  	  backend.execute :mkdir, "-p", release_path
      backend.execute :tar, "-xf", "#{repo_path}/#{fetch(:archive_name)}", "-C", release_path
      backend.execute :rm, "#{repo_path}/#{fetch(:archive_name)}"
  	end
  end
end
