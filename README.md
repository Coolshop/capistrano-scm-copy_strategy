capistrano-scm-copy_strategy
============================

A copy strategy for Capistrano 3, which mimics the `:copy` scm of Capistrano 2.

This will make Capistrano tar the current directory, upload it to the server(s) and then extract it in the release directory.


## Installation

First make sure you install the capistrano-scm-copy_strategy by adding it to your `Gemfile`:

    gem "capistrano-scm-copy_strategy"

Add to Capfile:

    require 'capistrano/scm/copy_strategy'
    install_plugin Capistrano::SCM::CopyStrategy


## Usage

By default the deploy strategy make a tar of all the current directory. Then pushes the tarball onto the server in the repo folder and expand it on the release directory.

If you like to customize the flow, here a list of available settings:


```ruby
# Folder to compress
set :include_dir, "." 

# Local temp folder where to temporary copy files
set :temp_folder, "#{Dir.tmpdir}", false

# Folder to exclude from the tarball. (Relative to the include dirs. You can use wildcards!)
set :exclude_dirs, []

# Name of the archive. By default is the release timestamp.
set :archive_name, "#{env.release_timestamp}.tar.gz"

```


    
## TODO

I'm new to programming for Capistrano and even Ruby in general. So any feedback is appreciated. 

License
=======

The MIT License (MIT)
