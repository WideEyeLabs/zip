def load_current_resource
  @zip = Chef::Resource::ZipPackage.new(@new_resource.name)
  @zip.app(@new_resource.app)
  Chef::Log.debug("Checking for application #{@new_resource.app}")
  @zip.installed(installed?)
end

action :install do
  unless @zip.installed
    zip_name  = @new_resource.zip_name ? @new_resource.zip_name : @new_resource.app
    cache_dir = "#{Chef::Config[:file_cache_path]}"
    zip_file  = "#{cache_dir}/#{zip_name}.zip"

    remote_file "#{zip_file} - #{zip_name}" do
      path zip_file
      source @new_resource.source
      checksum @new_resource.checksum if @new_resource.checksum
      only_if { @new_resource.source }
    end

    passphrase_cmd = @new_resource.zip_passphrase ? "-P #{@new_resource.zip_passphrase}" : ""
    ruby_block "unzip #{zip_file}" do
      block do
        system "unzip #{passphrase_cmd} -d '#{cache_dir}' '#{zip_file}'"
      end
      not_if ::File.exists?("#{cache_dir}/#{@new_resource.app}.app")
    end

    execute "cp -R '#{cache_dir}/#{@new_resource.app}.app' '#{@new_resource.destination}'" do
      user @new_resource.owner if @new_resource.owner
    end
  end
end

private
  def installed?
    if ( ::File.directory?("#{@new_resource.destination}/#{@new_resource.app}.app") )
      Chef::Log.info "Already installed; to upgrade, remove \"#{@new_resource.destination}/#{@new_resource.app}.app\""
      true
    else
      false
    end
  end

