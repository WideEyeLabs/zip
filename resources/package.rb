actions :install
default_action :install

attribute :app, :kind_of => String, :name_attribute => true
attribute :source, :kind_of => String, :default => nil
attribute :owner, :kind_of => String, :default => nil
attribute :destination, :kind_of => String, :default => "/Applications"
attribute :checksum, :kind_of => String, :default => nil
attribute :zip_name, :kind_of => String, :default => nil
attribute :installed, :kind_of => [TrueClass, FalseClass], :default => false
attribute :zip_passphrase, :kind_of => String, :default => nil

def initialize(name, run_context=nil)
  super
  @action = :install
end
