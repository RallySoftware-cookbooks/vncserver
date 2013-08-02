actions :create
default_action :create

attribute :name,           :kind_of => String, :name_attribute => true
attribute :server_num,     :kind_of => Integer, :name_attribute => false
attribute :server_names,   :kind_of => [ String, Array ], :name_attribute => false
attribute :server_args,    :kind_of => [ String, Array ], :name_attribute => false

def initialize(*args)
  super
  @action = :create
end
