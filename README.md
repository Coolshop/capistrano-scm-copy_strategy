capistrano-scm-copy_strategy
============================

A copy strategy for Capistrano 3, which mimics the `:copy` scm of Capistrano 2.

This will make Capistrano tar the current directory, upload it to the server(s) and then extract it in the release directory.


Installation
============

First make sure you install the capistrano-scm-copy_strategy by adding it to your `Gemfile`:

    gem "capistrano-scm-copy_strategy"

Add to Capfile:

    require 'capistrano/scm/copy_strategy'
    install_plugin Capistrano::SCM::CopyStrategy
    
TODO
====

I'm new to programming for Capistrano and even Ruby in general. So any feedback is appreciated. 

License
=======

The MIT License (MIT)
