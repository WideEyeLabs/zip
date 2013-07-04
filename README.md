Description
============

Lightweight resource and provider to install OSX applications from zip
files.

Requirements
============

## Platform:

* Mac OSX

Resources and Providers
=======================

zip\_package
------------

This resource will install an application from a zip. It will retrieve
the zip from a remote URL, unzip it using OSX's 'unzip', copy the
application to the Applications directory. The zip file will be stored
in the `Chef::Config[:file_cache_path]`. If you want to install an
application that has already been downloaded (not using the `source`
parameter), copy it to the appropriate location. You can find out what
directory this is with the following command on the node to run chef:

    knife exec -E 'p Chef::Config[:file_cache_path]' -c
/etc/chef/client.rb

# Actions:

* :install - Installs the application.

# Parameter attributes:

* 'app' - This is the name of the application used by default for the
  .app copied to the Applications directory.
* 'source' - This is the url for the zip download. Default is nil
* 'owner' - Owner that should own the application install.
* 'destination' - Directory to copy the app into. Default is
  /Applications. 
* 'checksum' - Sha256 checksum of the zip to download. Default is nil 
* 'zip_name' - Specify the name of the zip if it is not the same as
  `app`, or if the name has spaces.
* 'zip_passphrase' - Specify a passphrase to use to unencrypt the zip
  while unzipping.

Usage Examples
==============

Install `/Applications/SizeUp.app` from the primary download site.

    zip_package "SizeUp" do
      source
"http://www.irradiatedsoftware.com/downloads/?file=SizeUp.zip"
      checksum
"8eee88fbe6cfc9b298c6c0e44092549d595306d29466320b8237b3ea88e70395"
      action :install
    end

Contributing
============

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Author
==================

The MIT License (MIT)

Copyright (c) 2013, Chris <chris@wideeyelabs.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

