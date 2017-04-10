capistrano-scm-copy-strategy
============================

A copy strategy for Capistrano 3, which mimics the `:copy` scm of Capistrano 2.

This will make Capistrano tar the current directory, upload it to the server(s) and then extract it in the release directory.


Installation
============

First make sure you install the capistrano-scm-copy-strategy by adding it to your `Gemfile`:

    gem "capistrano-scm-copy-strategy"

Add to Capfile:

    require 'capistrano/scm/copy-strategy'
    install_plugin Capistrano::SCM::CopyStrategy
    
TODO
====

I'm new to programming for Capistrano and even Ruby in general. So any feedback is appreciated. 

License
=======

The MIT License (MIT)
